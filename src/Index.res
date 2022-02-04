%%raw(`
require('tailwindcss/tailwind.css');
`)

let root = Dom2.Document.getElementById_UNSAFE(Dom2.Window.document, "root")
ReactDOM.render(<Components.App />, root)
