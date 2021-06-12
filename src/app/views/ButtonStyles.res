type buttonState = [#Ready | #Disabled | #Processing]
type buttonColor = [#None | #LightGray | #Gray | #Green | #Blue | #Red]
type buttonSize = [#Base | #Small]

let getColor = (color: buttonColor, state: buttonState) => {
  switch color {
  | #None =>
    switch state {
    | #Ready => "bg-transparent"
    | #Disabled => "bg-transparent"
    | #Processing => "bg-transparent"
    }
  | #LightGray =>
    switch state {
    | #Ready => "bg-gray-400 hover:bg-gray-300"
    | #Disabled => "bg-gray-200"
    | #Processing => "bg-gray-200"
    }
  | #Gray =>
    switch state {
    | #Ready => "bg-gray-500 hover:bg-gray-400"
    | #Disabled => "bg-gray-200"
    | #Processing => "bg-gray-200"
    }
  | #Green =>
    switch state {
    | #Ready => "bg-green-600 hover:bg-green-500"
    | #Disabled => "bg-gray-300"
    | #Processing => "bg-gray-300"
    }
  | #Blue =>
    switch state {
    | #Ready => "bg-blue-500 hover:bg-blue-400"
    | #Disabled => "bg-gray-300"
    | #Processing => "bg-gray-300"
    }
  | #Red =>
    switch state {
    | #Ready => "bg-red-500 hover:bg-red-400"
    | #Disabled => "bg-gray-300"
    | #Processing => "bg-gray-300"
    }
  }
}

let getSize = (size: buttonSize) => {
  switch size {
  | #Base => "text-base py-4 px-6"
  | #Small => "text-sm py-2 px-4"
  }
}

let getFull = full => full ? "w-full" : ""

let makeClassName = (~state, ~color, ~size, ~full) =>
  "text-white text-center font-semibold rounded" ++
  " " ++
  getSize(size) ++
  " " ++
  getColor(color, state) ++
  " " ++
  getFull(full)
