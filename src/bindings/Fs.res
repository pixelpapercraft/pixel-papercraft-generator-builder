module Stats = {
  type t
  @send external isDirectory: t => bool = "isDirectory"
  @send external isFile: t => bool = "isFile"
}

type file
@module("fs") external readdirSync: string => array<string> = "readdirSync"

@module("fs") external writeFileSync: (string, string) => unit = "writeFileSync"

@module("fs") external readFileSync: string => file = "readFileSync"

@module("fs") external statSync: string => Stats.t = "statSync"

type rmdirOptions = {recursive: bool}
@module("fs") external rmdirSync: (string, rmdirOptions) => unit = "rmdirSync"

@module("fs") external mkdirSync: string => unit = "mkdirSync"

@module("fs") external existsSync: string => bool = "existsSync"
