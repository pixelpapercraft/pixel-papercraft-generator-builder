module RegionInputs = {
  let px = n => `${Js.Int.toString(n)}px`

  @react.component
  let make = (
    ~model: Builder.Model.t,
    ~currentPageId: string,
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
          let (x, y, w, h) = region
          let style = ReactDOM.Style.make(~top=px(y), ~left=px(x), ~width=px(w), ~height=px(h), ())
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

@react.component
let make = (
  ~generatorDef: Builder.generatorDef,
  ~model: Builder.Model.t,
  ~onChange: unit => unit,
) => {
  let onDownload = _ => {
    let doc = JsPdf.make({
      orientation: #portrait,
      unit: #mm,
      format: #a4,
    })
    model.pages->Js.Array2.forEachi((page, index) => {
      let dataUrl = Dom2.Canvas.toDataUrlAsPng(page.canvas)
      if index > 0 {
        JsPdf.addPage(doc, #a4, #portrait)
      }
      doc->JsPdf.addImage(dataUrl, #PNG, 0, 0, PageSize.A4.mm.width, PageSize.A4.mm.height)
    })
    doc->JsPdf.save(generatorDef.name)
  }

  let showPageIds = Js.Array2.length(model.pages) > 1

  <div>
    <div className="mb-4">
      <Buttons.Button state=#Ready size=#Small color=#Green onClick={onDownload}>
        {React.string("Download as PDF")}
      </Buttons.Button>
    </div>
    {model.pages
    ->Js.Array2.map(page => {
      let dataUrl = Dom2.Canvas.toDataUrlAsPng(page.canvas)
      <div key={page.id}>
        {showPageIds
          ? <h1 className="font-bold text-2xl mb-4"> {React.string(page.id)} </h1>
          : React.null}
        <img
          className="border shadow-xl mb-8"
          style={ReactDOM.Style.make(
            ~width="595px",
            ~height="842px",
            (),
          )->ReactDOM.Style.unsafeAddStyle({"imageRendering": "pixelated"})}
          src={dataUrl}
        />
        <RegionInputs
          model={model}
          currentPageId={page.id}
          onClick={callback => {
            callback()
            onChange()
          }}
        />
      </div>
    })
    ->React.array}
  </div>
}
