type t = [#undefined | #object | #boolean | #number | #bigint | #string | #symbol | #function]

external typeof: 'a => t = "#typeof"

module Classify = {
  type function
  type object
  type symbol

  type t =
    | Bool(bool)
    | Null
    | Undefined
    | String(string)
    | Number(float)
    | Object(object)
    | Function(function)
    | Symbol(symbol)

  @bs.val external _internalClass: 'a => string = "Object.prototype.toString.call"
  external _asBool: 'a => bool = "%identity"
  external _asString: 'a => string = "%identity"
  external _asFloat: 'a => float = "%identity"
  external _asObject: 'a => object = "%identity"
  external _asFunction: 'a => function = "%identity"
  external _asSymbol: 'a => symbol = "%identity"

  let classify = value => {
    switch _internalClass(value) {
    | "[object Boolean]" => Ok(Bool(_asBool(value)))
    | "[object Null]" => Ok(Null)
    | "[object Undefined]" => Ok(Undefined)
    | "[object String]" => Ok(String(_asString(value)))
    | "[object Number]" => Ok(Number(_asFloat(value)))
    | "[object Function]" => Ok(Function(_asFunction(value)))
    | "[object Symbol]" => Ok(Symbol(_asSymbol(value)))
    | _ => Ok(Object(_asObject(value)))
    }
  }
}
