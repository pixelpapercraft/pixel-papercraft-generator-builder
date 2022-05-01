module Icon = Generator_Icon
module ButtonStyles = Generator_ButtonStyles

type buttonState = [#Ready | #Disabled | #Processing]
type buttonColor = [#None | #LightGray | #Gray | #Green | #Blue | #Red]
type buttonSize = [#Base | #Small]

let getDisabled = state => {
  switch state {
  | #Ready => false
  | #Disabled => true
  | #Processing => true
  }
}

let getContent = (state, children) => {
  switch state {
  | #Ready => children
  | #Disabled => children
  | #Processing => <Icon.ProgressSpin color=#White />
  }
}

module Button = {
  @react.component
  let make = (
    ~state: buttonState,
    ~onClick: ReactEvent.Mouse.t => unit,
    ~color: buttonColor=#Gray,
    ~size: buttonSize=#Base,
    ~full: bool=false,
    ~title: string="",
    ~children: React.element,
  ) => {
    let className = ButtonStyles.makeClassName(~state, ~color, ~size, ~full)
    <button
      title type_="button" className={className} disabled={getDisabled(state)} onClick={onClick}>
      {getContent(state, children)}
    </button>
  }
}

module IconButton = {
  let makeIcon = icon => {
    switch icon {
    | #ChevronDown => <Icon.ChevronDown color=#White />
    | #ChevronUp => <Icon.ChevronUp color=#White />
    | #ChevronDoubleDown => <Icon.ChevronDoubleDown color=#White />
    | #ChevronDoubleUp => <Icon.ChevronDoubleUp color=#White />
    | #Menu => <Icon.Menu color=#White />
    | #Trash => <Icon.Trash color=#White />
    | #X => <Icon.X color=#White />
    }
  }

  @react.component
  let make = (~title, ~onClick, ~icon, ~color, ~state) => {
    <Button title onClick color state size=#Small> {makeIcon(icon)} </Button>
  }
}
