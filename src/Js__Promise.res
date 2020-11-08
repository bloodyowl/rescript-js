type t<'a, 'b>

@bs.val external resolve: 'a => t<'a, unit> = "Promise.resolve"

@bs.val external reject: 'b => t<unit, 'b> = "Promise.reject"

@bs.val external all: array<t<'a, 'b>> => t<array<'a>, 'b> = "Promise.all"

@bs.val external all2: ((t<'a, 'b>, t<'c, 'd>)) => t<('a, 'b), _> = "Promise.all"

@bs.val external all3: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>)) => t<('a, 'c, 'e), _> = "Promise.all"

@bs.val
external all4: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>)) => t<('a, 'c, 'e, 'g), _> =
  "Promise.all"

@bs.val
external all5: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>, t<'i, 'j>)) => t<
  ('a, 'c, 'e, 'g, 'i),
  _,
> = "Promise.all"

@bs.val
external all6: ((t<'a, 'b>, t<'c, 'd>, t<'e, 'f>, t<'g, 'h>, t<'i, 'j>, t<'k, 'l>)) => t<
  ('a, 'c, 'e, 'g, 'i, 'k),
  _,
> = "Promise.all"

@bs.val external race: array<t<'a, 'b>> => t<'a, 'b> = "Promise.race"

@bs.send external then: (t<'a, 'b>, 'a => 'c) => t<'c, 'b> = "then"

@bs.send external flatThen: (t<'a, 'b>, 'a => t<'c, 'd>) => t<'c, 'd> = "then"

@bs.send external catch: (t<'a, 'b>, 'b => 'c) => t<'c, _> = "then"

@bs.send external flatCatch: (t<'a, 'b>, 'b => t<'c, 'd>) => t<'c, 'd> = "then"

@bs.send external finally: (t<'a, 'b>, unit => unit) => t<'a, 'b> = "finally"

type resolve<'a> = 'a => unit
type reject<'a> = 'a => unit

@bs.new external make: ((resolve<'a>, reject<'b>) => unit) => t<'a, 'b> = "Promise"
