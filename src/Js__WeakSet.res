type t<'a>

@bs.new external make: unit => t<'a> = "WeakSet"

@bs.send external add: (t<'a>, 'a) => t<'a> = "add"
@bs.send external delete: (t<'a>, 'a) => bool = "delete"
@bs.send external has: (t<'a>, 'a) => bool = "has"
