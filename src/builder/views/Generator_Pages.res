module PageSize = Generator_PageSize
module Builder = Generator_Builder
module Buttons = Generator_Buttons
module ButtonStyles = Generator_ButtonStyles

let px = n => `${Js.Int.toString(n)}px`

// The page has a border, so include this in calculations.
let pageBorderWidth = 1

module RegionInputs = {
  let scaleInt = (value, scale) =>
    (Belt.Int.toFloat(value) *. scale)->Js.Math.round->Belt.Float.toInt

  let scaleRegion = ((x, y, w, h), actualWidth) => {
    let scale = Js.Int.toFloat(actualWidth) /. Js.Int.toFloat(PageSize.A4.px.width)
    (scaleInt(x, scale), scaleInt(y, scale), scaleInt(w, scale), scaleInt(h, scale))
  }

  @react.component
  let make = (
    ~model: Builder.Model.t,
    ~currentPageId: string,
    ~containerWidth: int,
    ~onClick: (unit => unit) => unit,
  ) => {
    let regions = model.inputs->Js.Array2.reduce((acc, input) => {
      switch input {
      | RegionInput(pageId, region, callback) =>
        if pageId === currentPageId {
          Js.Array2.concat(acc, [(region, callback)])
        } else {
          acc
        }
      | _ => acc
      }
    }, [])

    if Js.Array2.length(regions) > 0 {
      <div>
        {regions
        ->Js.Array2.mapi(((region, callback), i) => {
          let (x, y, w, h) = scaleRegion(region, containerWidth)
          let style = ReactDOM.Style.make(
            ~top=px(y + pageBorderWidth),
            ~left=px(x + pageBorderWidth),
            ~width=px(w),
            ~height=px(h),
            (),
          )
          <div
            key={Js.Int.toString(i)}
            className="absolute border-4 border-transparent hover:border-blue-500"
            style={style}
            onClick={_ => onClick(callback)}
          />
        })
        ->React.array}
      </div>
    } else {
      React.null
    }
  }
}

module SaveAsPDFButton = {
  @react.component
  let make = (
    ~size: Buttons.buttonSize,
    ~color: Buttons.buttonColor,
    ~generatorDef: Builder.generatorDef,
    ~model: Builder.Model.t,
  ) => {
    let onSavePDF = _ => {
      let doc = JsPdf.make({
        orientation: #portrait,
        unit: #mm,
        format: #a4,
      })
      model.pages->Js.Array2.forEachi((page, index) => {
        let dataUrl = Dom2.Canvas.toDataUrlAsPng(page.canvasWithContext.canvas)
        if index > 0 {
          JsPdf.addPage(doc, #a4, #portrait)
        }
        doc->JsPdf.addImage(dataUrl, #PNG, 0, 0, PageSize.A4.mm.width, PageSize.A4.mm.height)
      })
      doc->JsPdf.save(generatorDef.name)
    }

    <Buttons.Button state=#Ready size color onClick={onSavePDF}>
      {React.string("Save as PDF")}
    </Buttons.Button>
  }
}

module SaveAsImageButton = {
  @react.component
  let make = (
    ~size: Buttons.buttonSize,
    ~color: Buttons.buttonColor,
    ~dataUrl: string,
    ~download: string,
  ) => {
    // Setting the `href` to a `data:` value triggers the download.
    // The `download` attribute is used as the filename.
    let (href, setHref) = React.useState(_ => "#")
    let onClick = _ => setHref(_ => dataUrl)
    let className = ButtonStyles.makeClassName(~state=#Ready, ~color, ~size, ~full=false)
    <a href={href} className={className} onClick={onClick} download={download}>
      {"Save as PNG"->React.string}
    </a>
  }
}

module PrintImageButton = {
  @react.component
  let make = (~size: Buttons.buttonSize, ~color: Buttons.buttonColor, ~dataUrl: string) => {
    let onClick = event => {
      ReactEvent.Synthetic.preventDefault(event)
      let image = Dom2.Image.make()
      let onLoad = () => {
        // onLoad is called twice for some reason, so clear it here
        image->Dom2.Image.onLoadOption(None)
        let imageEl = image->Dom2.Image.asElement
        // We subtract 1mm from the width and height to prevent
        // Chrome trying to print onto two pages.
        let styles = `
          @media print {
            html, body, img {
              margin: 0;
              padding: 0;
              width: ${Js.Int.toString(PageSize.A4.mm.width - 1)}mm;
              height: ${Js.Int.toString(PageSize.A4.mm.height - 1)}mm;
            }
          }
        `
        PrintHtmlElement.printElement(imageEl, {styles: styles})
      }
      image->Dom2.Image.onLoadOption(Some(onLoad))
      image->Dom2.Image.src(dataUrl)
    }
    let className = ButtonStyles.makeClassName(~state=#Ready, ~color, ~size, ~full=false)
    <a href="#" className={className} onClick={onClick}> {"Print"->React.string} </a>
  }
}

let useElementWidthListener = (elRef: React.ref<Js.Nullable.t<Dom2.Element.t>>) => {
  let (width, setWidth) = React.useState(() => None)

  React.useEffect0(() => {
    let updateWidth = () => {
      switch elRef.current->Js.Nullable.toOption {
      | None => ()
      | Some(el) => {
          let width = el->Dom2.Element.width
          setWidth(_ => Some(width))
        }
      }
    }

    let onResize = _ => {
      updateWidth()
    }

    Dom2.Window.instance->Dom2.Window.asElement->Dom2.Element.addEventListener("resize", onResize)

    updateWidth()

    Some(
      () => {
        Dom2.Window.instance
        ->Dom2.Window.asElement
        ->Dom2.Element.removeEventListener("resize", onResize)
      },
    )
  })

  width
}

@react.component
let make = (
  ~generatorDef: Builder.generatorDef,
  ~model: Builder.Model.t,
  ~onChange: unit => unit,
) => {
  let containerElRef: React.ref<Js.Nullable.t<Dom2.Element.t>> = React.useRef(Js.Nullable.null)
  let containerWidth = useElementWidthListener(containerElRef)

  let showPageIds = Js.Array2.length(model.pages) > 1

  <div>
    {model.pages
    ->Js.Array2.mapi((page, index) => {
      let dataUrl = Dom2.Canvas.toDataUrlAsPng(page.canvasWithContext.canvas)

      let fileName =
        Belt.Array.length(model.pages) > 1
          ? generatorDef.name ++ " - " ++ page.id
          : generatorDef.name

      let canvasStyle = {
        ReactDOM.Style.make()->ReactDOM.Style.unsafeAddStyle({
          "imageRendering": "pixelated",
        })
      }
      // h - w / 2
      let transformStyle = ReactDOM.Style.make(
        ~transform=`${page.isLandscape
            ? `rotate(270deg) translateX(123.5px) translateY(123.5px)`
            : ``}`,
        (),
      )

      let style = ReactDOM.Style.combine(canvasStyle, transformStyle)

      let pageMaxWidth = PageSize.A4.px.width //page.isLandscape ? PageSize.A4.px.height : PageSize.A4.px.width

      <div key={page.id}>
        {showPageIds
          ? <h1 className="font-bold text-2xl mb-4"> {React.string(page.id)} </h1>
          : React.null}
        <div
          className="mb-4 flex justify-between items-center"
          style={ReactDOM.Style.make(~maxWidth={px(pageMaxWidth)}, ())}>
          // set to width instead of maxWidth for enabling side by side
          <div>
            <span className="mr-4">
              <PrintImageButton size=#Small color=#Blue dataUrl={dataUrl} />
            </span>
            <SaveAsImageButton size=#Small color=#Blue dataUrl={dataUrl} download={fileName} />
          </div>
          <div>
            {index == 0
              ? <SaveAsPDFButton
                  size=#Small color=#Green generatorDef={generatorDef} model={model}
                />
              : React.null}
          </div>
        </div>
        // Important: The following div uses absolute positioning for the regions.
        <div
          className="relative"
          style={ReactDOM.Style.make(~maxWidth={px(pageMaxWidth + pageBorderWidth * 2)}, ())}>
          <img
            ref={ReactDOM.Ref.domRef(containerElRef)}
            className="border shadow-xl mb-8"
            style
            src={dataUrl}
          />
          {switch containerWidth {
          | None => React.null
          | Some(containerWidth) =>
            <RegionInputs
              containerWidth={containerWidth}
              model={model}
              currentPageId={page.id}
              onClick={callback => {
                callback()
                onChange()
              }}
            />
          }}
        </div>
      </div>
    })
    ->React.array}
  </div>
}
