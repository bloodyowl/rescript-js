type t<'k, 'v>

@bs.new external make: unit => t<'k, 'v> = "Map"
@bs.new external fromArray: array<('k, 'v)> => t<'k, 'v> = "Map"
@bs.new external fromIterator: Js__Iterator.t<('k, 'v)> => t<'k, 'v> = "Map"

@bs.get external size: t<'k, 'v> => int = "size"

@bs.send external clear: t<'k, 'v> => unit = "clear"

@bs.send external forEach: (t<'k, 'v>, 'v => unit) => unit = "forEach"
@bs.send external forEachWithKey: (t<'k, 'v>, ('v, 'k) => unit) => unit = "forEach"

@bs.send external get: (t<'k, 'v>, 'k) => option<'v> = "get"
@bs.send external has: (t<'k, 'v>, 'k) => bool = "has"
@bs.send external set: (t<'k, 'v>, 'k, 'v) => t<'k, 'v> = "set"
@bs.send external delete: (t<'k, 'v>, 'k) => bool = "delete"

@bs.send external keys: t<'k, 'v> => Js__Iterator.t<'k> = "keys"
@bs.send external values: t<'k, 'v> => Js__Iterator.t<'v> = "values"
@bs.send external entries: t<'k, 'v> => Js__Iterator.t<('k, 'v)> = "entries"
