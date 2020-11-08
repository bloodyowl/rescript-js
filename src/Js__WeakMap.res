type t<'k, 'v>

@bs.new external make: unit => t<'k, 'v> = "WeakMap"

@bs.send external get: (t<'k, 'v>, 'k) => option<'v> = "get"
@bs.send external has: (t<'k, 'v>, 'k) => bool = "has"
@bs.send external set: (t<'k, 'v>, 'k, 'v) => t<'k, 'v> = "set"
@bs.send external delete: (t<'k, 'v>, 'k) => bool = "delete"
