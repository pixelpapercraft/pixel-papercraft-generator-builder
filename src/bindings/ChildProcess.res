type execCallback = (. Js.Nullable.t<exn>, Js.Nullable.t<string>, Js.Nullable.t<string>) => unit

@module("child_process")
external exec: (string, execCallback) => unit = "exec"
