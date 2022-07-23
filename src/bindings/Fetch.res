type jsonResponse
type fetchMode = [#"no-cors" | #cors | #"same-origin"]
type fetchOptions

@obj external makeFetchOptions: (~mode: fetchMode=?, unit) => fetchOptions = ""
@val external fetchJson: string => Promise.t<jsonResponse> = "fetch"
@val external fetchJsonWithOptions: (string, fetchOptions) => Promise.t<jsonResponse> = "fetch"
@send external json: jsonResponse => Promise.t<Js.Json.t> = "json"
