type t<'a>

@bs.new external make: unit => t<'a> = "Set"
@bs.new external fromArray: array<'a> => t<'a> = "Set"
@bs.new external fromIterator: Js__Iterator.t<'a> => t<'a> = "Set"

@bs.get external size: t<'a> => int = "size"

@bs.send external clear: t<'a> => unit = "clear"

@bs.send external add: (t<'a>, 'a) => t<'a> = "add"
@bs.send external delete: (t<'a>, 'a) => bool = "delete"
@bs.send external has: (t<'a>, 'a) => bool = "has"

@bs.send external forEach: (t<'a>, 'a => unit) => unit = "forEach"

@bs.send external values: t<'a> => Js__Iterator.t<'a> = "values"
