open Dom2

// https://htmldom.dev/print-an-image/

let print = (elementToPrint: Dom.element) => {
  let docBodyEl = Document.document->Document.body->Body.asElement

  let iframe = Document.document->Document.createIframeElement
  let iframeEl = iframe->Iframe.asElement
  let iframeStyle = iframeEl->Element.style

  iframeStyle->Style.height(0)
  iframeStyle->Style.width(0)
  iframeStyle->Style.visibility(#hidden)

  iframe->Iframe.setSrcDocAttribute("<html><body style=\"margin:0;padding:0\"></body></html>")

  docBodyEl->Element.appendChild(iframeEl)

  iframeEl->Element.addEventListener("afterprint", _ => {
    iframe->Iframe.parentNode->Element.removeChild(iframeEl)
  })

  iframeEl->Element.addEventListener("load", _ => {
    let iframeBodyEl = iframe->Iframe.contentDocument->Document.body->Body.asElement
    iframeBodyEl->Element.style->Style.textAlign(#center)
    iframeBodyEl->Element.appendChild(elementToPrint)
    iframe->Iframe.contentWindow->Window.print
  })
}
