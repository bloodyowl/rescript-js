type undefined = {__rescript_private_none: bool}

let encodeUndefined = (_key, value) =>
  value === Js__Undefined.empty ? Js__Undefined.make({__rescript_private_none: true}) : value

@bs.val external _stringify: ('a, (string, 'b) => 'c) => option<string> = "JSON.stringify"
let serializeExn = x => _stringify(x, encodeUndefined)

@bs.val external _parse: (string, @bs.this ({..}, string, 'b) => 'c) => 'a = "JSON.parse"

let deserializeUnsafe = x => {
  let undefinedValues = []
  let value = _parse(x, @bs.this
  (this, key, value) => {
    switch value->Js__Nullable.toOption {
    | Some(x) when x.__rescript_private_none =>
      let _ = undefinedValues->Js__Array.push((this, key))
    | _ => ()
    }
    value
  })
  undefinedValues->Js__Array.forEach(((object, key)) => {
    object->Js__Object.set(key, Js.Undefined.empty)
  })
  value
}
