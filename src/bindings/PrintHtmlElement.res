type options = {styles: string}

@module("print-html-element")
external printElement: (Dom.element, options) => unit = "printElement"
