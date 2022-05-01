type t

type cb = (Js.Nullable.t<exn>, Js.Nullable.t<t>) => unit

@module @new external make: (int, int, cb) => unit = "jimp"

@send external blit: (t, t, int, int) => t = "blit"

@module("jimp") external read: string => Promise.t<t> = "read"

@send external writeAsync: (t, string) => Promise.t<unit> = "writeAsync"
