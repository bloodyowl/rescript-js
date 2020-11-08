type undefined = {__rescript_private_none: bool}

let encodeUndefined = (_key, value) =>
  value === Js__Undefined.empty ? Js__Undefined.make({__rescript_private_none: true}) : value

let decodeUndefined = (_key, value) =>
  switch value->Js__Nullable.toOption {
  | Some(value) when value.__rescript_private_none => Js__Undefined.empty
  | value => Js__Undefined.make(value)
  }

@bs.val external _stringify: ('a, (string, 'b) => 'c) => option<string> = "JSON.stringify"
let serializeExn = x => _stringify(x, encodeUndefined)

@bs.val external _parse: ('a, (string, 'b) => 'c) => 'a = "JSON.parse"
let deserializeUnsafe = x => _parse(x, decodeUndefined)
