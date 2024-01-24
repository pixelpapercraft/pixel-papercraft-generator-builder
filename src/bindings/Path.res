type parseResult = {base: string, ext: string, name: string}

@module("path") external parse: string => parseResult = "parse"

@module("path") external resolve: (string, string) => string = "resolve"
