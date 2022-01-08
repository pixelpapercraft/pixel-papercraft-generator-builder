@react.component
let make = (~children: string) => {
  let html = Marked.parse(children)
  <div className="prose xmax-w-none" dangerouslySetInnerHTML={{"__html": html}} />
}
