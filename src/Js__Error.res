type t = Js.Exn.t

external fromException: exn => option<t> = "caml_as_js_exn"
external toException: t => exn = "%identity"

@bs.get external stack: t => option<string> = "stack"
@bs.get external message: t => option<string> = "message"
@bs.get external name: t => option<string> = "name"
@bs.get external fileName: t => option<string> = "fileName"

@bs.new external make: string => t = "Error"

module EvalError = {
  @bs.new external make: string => t = "EvalError"
}

module RangeError = {
  @bs.new external make: string => t = "RangeError"
}

module ReferenceError = {
  @bs.new external make: string => t = "ReferenceError"
}

module SyntaxError = {
  @bs.new external make: string => t = "SyntaxError"
}

module TypeError = {
  @bs.new external make: string => t = "TypeError"
}

module URIError = {
  @bs.new external make: string => t = "URIError"
}

external raise: t => 'a = "%raise"
