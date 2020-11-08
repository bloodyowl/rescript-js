type t<'a> = Js.Null.t<'a>

external empty: t<'a> = "#null"

external make: 'a => t<'a> = "%identity"

external toOption: t<'a> => option<'a> = "#null_to_opt"

let fromOption: option<'a> => t<'a> = option =>
  switch option {
  | Some(x) => make(x)
  | None => empty
  }
