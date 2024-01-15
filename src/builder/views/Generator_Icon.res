module DownArrow = {
  // https://tailwindcomponents.com/component/dropdown-1

  @react.component
  let make = () => {
    <svg className="w-2 h-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 412 232">
      <path
        d="M206 171.144L42.678 7.822c-9.763-9.763-25.592-9.763-35.355 0-9.763 9.764-9.763 25.592 0 35.355l181 181c4.88 4.882 11.279 7.323 17.677 7.323s12.796-2.441 17.678-7.322l181-181c9.763-9.764 9.763-25.592 0-35.355-9.763-9.763-25.592-9.763-35.355 0L206 171.144z"
        fill="#648299"
        fillRule="nonzero"
      />
    </svg>
  }
}

module Upload = {
  @react.component
  let make = () => {
    <svg fill="#FFF" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg">
      <path d="M0 0h24v24H0z" fill="none" />
      <path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z" />
    </svg>
  }
}

// https://github.com/tailwindlabs/heroicons

let sizeClass = size => {
  switch size {
  | #Small => "w-3 h-3"
  | #Medium => "w-5 h-5"
  }
}

let colorClass = color => {
  switch color {
  | #Black => "text-black"
  | #White => "text-white"
  | #Gray500 => "text-gray-500"
  }
}

let makeClassName = (size, color) => "inline-block " ++ sizeClass(size) ++ " " ++ colorClass(color)

module ChevronUp = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 15l7-7 7 7" />
    </svg>
  }
}

module ChevronDown = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
    </svg>
  }
}

module ChevronRight = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 5l7 7-7 7" />
    </svg>
  }
}

module ChevronLeft = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 19l-7-7 7-7" />
    </svg>
  }
}

module ChevronDoubleUp = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 11l7-7 7 7M5 19l7-7 7 7"
      />
    </svg>
  }
}

module ChevronDoubleDown = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M19 13l-7 7-7-7m14-8l-7 7-7-7"
      />
    </svg>
  }
}

module ChevronDoubleRight = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 5l7 7-7 7M5 5l7 7-7 7"
      />
    </svg>
  }
}

module ChevronDoubleLeft = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M11 19l-7-7 7-7m8 14l-7-7 7-7"
      />
    </svg>
  }
}
module Eye = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
      />
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
      />
    </svg>
  }
}

module EyeOff = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"
      />
    </svg>
  }
}

module Menu = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h16M4 18h16"
      />
    </svg>
  }
}

module ProgressSpin = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color) ++ " animate-spin"}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24">
      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
      <path
        className="opacity-75"
        fill="currentColor"
        d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
      />
    </svg>
  }
}

module Trash = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth="2"
        d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
      />
    </svg>
  }
}

module X = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      className={makeClassName(size, color)}
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
    </svg>
  }
}

module ArrowDown = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"
      />
    </svg>
  }
}

module ArrowLeft = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"
      />
    </svg>
  }
}

module ArrowRight = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M14 5l7 7m0 0l-7 7m7-7H3"
      />
    </svg>
  }
}

module ArrowUp = {
  @react.component
  let make = (~size=#Medium, ~color=#Black) => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      className={makeClassName(size, color)}
      fill="none"
      viewBox="0 0 24 24"
      stroke="currentColor">
      <path
        strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 10l7-7m0 0l7 7m-7-7v18"
      />
    </svg>
  }
}
