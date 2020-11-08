type t = Js.Json.t

@bs.val external parseExn: string => t = "JSON.parse"
@bs.val external stringify: t => string = "JSON.stringify"
@bs.val external stringifyWithIndent: (t, @bs.as(json`null`) _, int) => string = "JSON.stringify"

@bs.val external parseToAnyExn: string => 'a = "JSON.parse"
@bs.val external stringifyAny: 'a => option<string> = "JSON.stringify"
@bs.val
external stringifyAnyWithIndent: (t, @bs.as(json`null`) _, int) => option<string> = "JSON.stringify"

module Decode = {
  type t =
    | Bool(bool)
    | Null
    | String(string)
    | Number(float)
    | Object(Js__Dict.t<t>)
    | Array(array<t>)

  @bs.val external _internalClass: 'a => string = "Object.prototype.toString.call"
  external _asBool: 'a => bool = "%identity"
  external _asString: 'a => string = "%identity"
  external _asFloat: 'a => float = "%identity"
  external _asArray: 'a => array<'b> = "%identity"
  external _asDict: 'a => Js__Dict.t<'b> = "%identity"

  let classify = value => {
    switch _internalClass(value) {
    | "[object Boolean]" => Ok(Bool(_asBool(value)))
    | "[object Null]" => Ok(Null)
    | "[object String]" => Ok(String(_asString(value)))
    | "[object Number]" => Ok(Number(_asFloat(value)))
    | "[object Array]" => Ok(Array(_asArray(value)))
    | _ => Ok(Object(_asDict(value)))
    }
  }
}

module Encode = {
  external bool: bool => t = "%identity"
  external null: t = "#null"
  external string: string => t = "%identity"
  external int: int => t = "%identity"
  external float: float => t = "%identity"
  external object: Js__Dict.t<t> => t = "%identity"
  external array: array<t> => t = "%identity"
}
