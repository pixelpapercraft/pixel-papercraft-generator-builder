let px = n => `${Js.Int.toString(n)}px`
let deg = n => `${Js.Int.toString(n)}deg`
let makeBackgroundImage = url => `url(${url})`
let makeBackgroundPosition = (x, y) => `${px(x)} ${px(y)}`
let makeBackgroundSize = (x, y) => `${px(x)} ${px(y)}`
let makeBorder = (size, style, color) => `${px(size)} ${style} ${color}`
let makeMargin = (t, r, b, l) => `${px(t)} ${px(r)} ${px(b)} ${px(l)}`
let makePadding = (t, r, b, l) => `${px(t)} ${px(r)} ${px(b)} ${px(l)}`
