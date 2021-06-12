open Dom2.Document

%%raw(`
require('tailwindcss/tailwind.css');
`)

let root = getElementById_UNSAFE(document, "root")
ReactDOM.render(<App />, root)
