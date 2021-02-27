type t<'a, 'b>

external fromJsPromise: Js.Promise.t<'a> => t<'a, Js.Promise.error> = "%identity"
external toJsPromise: t<'a, 'b> => Js.Promise.t<'a> = "%identity"

@val external resolve: 'a => t<'a, unit> = "Promise.resolve"

@val external reject: 'b => t<unit, 'b> = "Promise.reject"

@val external all: array<t<'a, 'b>> => t<array<'a>, 'b> = "Promise.all"

@val external all2: ((t<'a, 'b>, t<'c, 'd>)) => t<('a, 'b), _> = "Promise.all"

@val external all3: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>)) => t<('a, 'c, 'e), _> = "Promise.all"

@val
external all4: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>)) => t<('a, 'c, 'e, 'g), _> =
  "Promise.all"

@val
external all5: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>, t<'i, 'j>)) => t<
  ('a, 'c, 'e, 'g, 'i),
  _,
> = "Promise.all"

@val
external all6: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>, t<'i, 'j>, t<'k, 'l>)) => t<
  ('a, 'c, 'e, 'g, 'i, 'k),
  _,
> = "Promise.all"

@val external race: array<t<'a, 'b>> => t<'a, 'b> = "Promise.race"

@send external then: (t<'a, 'b>, 'a => 'c) => t<'c, 'b> = "then"

@send external flatThen: (t<'a, 'b>, 'a => t<'c, 'd>) => t<'c, 'd> = "then"

@send external catch: (t<'a, 'b>, 'b => 'c) => t<'c, _> = "catch"

@send external flatCatch: (t<'a, 'b>, 'b => t<'c, 'd>) => t<'c, 'd> = "catch"

@send external finally: (t<'a, 'b>, unit => unit) => t<'a, 'b> = "finally"

type resolve<'a> = 'a => unit
type reject<'a> = 'a => unit

@new external make: ((resolve<'a>, reject<'b>) => unit) => t<'a, 'b> = "Promise"
