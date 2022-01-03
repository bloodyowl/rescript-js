@val external from: 'a => array<'b> = "Array.from"
@val external fromWithMap: ('a, 'b => 'c) => array<'c> = "Array.from"

@val external fromArrayLike: Js.Array2.array_like<'a> => array<'a> = "Array.from"
@val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => array<'a> = "Array.from"

@val external fromIterator: Js__Iterator.t<'a> => array<'a> = "Array.from"
@val external fromIteratorWithMap: (Js__Iterator.t<'a>, 'a => 'c) => array<'a> = "Array.from"

@val external isArray: 'a => bool = "Array.isArray"

@get external length: array<'a> => int = "length"

@send external copyAllWithin: (array<'a>, ~target: int) => array<'a> = "copyWithin"

@send
external copyWithinToEnd: (array<'a>, ~target: int, ~start: int) => array<'a> = "copyWithin"

@send
external copyWithin: (array<'a>, ~target: int, ~start: int, ~end: int) => array<'a> = "copyWithin"

@send external fillAllInPlace: (array<'a>, 'a) => array<'a> = "fill"

@send external fillInPlaceToEnd: (array<'a>, 'a, ~start: int) => array<'a> = "fill"

@send external fillInPlace: (array<'a>, 'a, ~start: int, ~end: int) => array<'a> = "fill"

@send external pop: array<'a> => option<'a> = "pop"

@send external push: (array<'a>, 'a) => int = "push"

@variadic @send external pushMany: (array<'a>, array<'a>) => int = "push"

@send external reverseInPlace: array<'a> => array<'a> = "reverse"

@send external shift: array<'a> => option<'a> = "shift"

@send external sortInPlace: (array<'a>, ('a, 'a) => int) => array<'a> = "sort"

@variadic @send
external spliceInPlace: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "splice"

@send external unshift: (array<'a>, 'a) => int = "unshift"

@variadic @send external unshiftMany: (array<'a>, array<'a>) => int = "unshift"

@send external concat: (array<'a>, array<'a>) => array<'a> = "concat"

@variadic @send external concatMany: (array<'a>, array<array<'a>>) => array<'a> = "concat"

@send external includes: (array<'a>, 'a) => bool = "includes"

@send external indexOf: (array<'a>, 'a) => int = "indexOf"
@send external indexOfFrom: (array<'a>, 'a, ~from: int) => int = "indexOf"

@send external joinWith: (array<'a>, string) => string = "join"

@send external lastIndexOf: (array<'a>, 'a) => int = "lastIndexOf"
@send external lastIndexOfFrom: (array<'a>, 'a, ~from: int) => int = "lastIndexOf"

@send external slice: (array<'a>, ~from: int, ~end: int) => array<'a> = "slice"
@send external sliceToEnd: (array<'a>, ~from: int) => array<'a> = "slice"
@send external copy: array<'a> => array<'a> = "slice"

@send external toString: array<'a> => string = "toString"
@send external toLocaleString: array<'a> => string = "toLocaleString"

@send external every: (array<'a>, 'a => bool) => bool = "every"
@send external everyWithIndex: (array<'a>, ('a, int) => bool) => bool = "every"

@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"
@send external filterWithIndex: (array<'a>, ('a, int) => bool) => array<'a> = "filter"

@send external find: (array<'a>, 'a => bool) => option<'a> = "find"
@send external findWithIndex: (array<'a>, ('a, int) => bool) => option<'a> = "find"

@send external findIndex: (array<'a>, 'a => bool) => int = "findIndex"
@send external findIndexWithIndex: (array<'a>, ('a, int) => bool) => int = "findIndex"

@send external forEach: (array<'a>, 'a => unit) => unit = "forEach"
@send external forEachWithIndex: (array<'a>, ('a, int) => unit) => unit = "forEach"

@send external map: (array<'a>, 'a => 'b) => array<'b> = "map"
@send external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

@send external reduce: (array<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduce"
@send external reduceWithIndex: (array<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduce"

@send external reduceRight: (array<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
@send external reduceRightWithIndex: (array<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"

@send external some: (array<'a>, 'a => bool) => bool = "some"
@send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

@get_index external get: (array<'a>, int) => option<'a> = ""
@set_index external set: (array<'a>, int, 'a) => unit = ""

@get_index external getSymbol: (array<'a>, Js__Symbol.t) => option<'b> = ""
@get_index external getSymbolUnsafe: (array<'a>, Js__Symbol.t) => 'b = ""
@set_index external setSymbol: (array<'a>, Js__Symbol.t, 'b) => unit = ""
