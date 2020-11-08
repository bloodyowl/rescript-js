@bs.val external from: 'a => array<'b> = "Array.from"
@bs.val external fromWithMap: ('a, 'b => 'c) => array<'c> = "Array.from"

@bs.val external fromArrayLike: Js.Array2.array_like<'a> => array<'a> = "Array.from"
@bs.val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => array<'a> = "Array.from"

@bs.val external fromIterator: Js__Iterator.t<'a> => array<'a> = "Array.from"
@bs.val external fromIteratorWithMap: (Js__Iterator.t<'a>, 'a => 'c) => array<'a> = "Array.from"

@bs.val external isArray: 'a => bool = "Array.isArray"

@bs.get external length: array<'a> => int = "length"

@bs.send external copyAllWithin: (array<'a>, ~target: int) => array<'a> = "copyWithin"

@bs.send
external copyWithinToEnd: (array<'a>, ~target: int, ~start: int) => array<'a> = "copyWithin"

@bs.send
external copyWithin: (array<'a>, ~target: int, ~start: int, ~end: int) => array<'a> = "copyWithin"

@bs.send external fillAllInPlace: (array<'a>, 'a) => array<'a> = "fill"

@bs.send external fillInPlaceToEnd: (array<'a>, 'a, ~start: int) => array<'a> = "fill"

@bs.send external fillInPlace: (array<'a>, 'a, ~start: int, ~end: int) => array<'a> = "fill"

@bs.send external pop: array<'a> => option<'a> = "pop"

@bs.send external push: (array<'a>, 'a) => int = "push"

@bs.variadic @bs.send external pushMany: (array<'a>, array<'a>) => int = "push"

@bs.send external reverseInPlace: array<'a> => array<'a> = "reverse"

@bs.send external shift: array<'a> => option<'a> = "shift"

@bs.send external sortInPlace: (array<'a>, ('a, 'a) => int) => array<'a> = "sort"

@bs.variadic @bs.send
external spliceInPlace: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "sort"

@bs.send external unshift: (array<'a>, 'a) => int = "unshift"

@bs.variadic @bs.send external unshiftMany: (array<'a>, array<'a>) => int = "unshift"

@bs.send external concat: (array<'a>, array<'a>) => array<'a> = "concat"

@bs.variadic @bs.send external concatMany: (array<'a>, array<array<'a>>) => array<'a> = "concat"

@bs.send external includes: (array<'a>, 'a) => bool = "includes"

@bs.send external indexOf: (array<'a>, 'a) => int = "indexOf"
@bs.send external indexOfFrom: (array<'a>, 'a, ~from: int) => int = "indexOf"

@bs.send external joinWith: (array<'a>, string) => string = "join"

@bs.send external lastIndexOf: (array<'a>, 'a) => int = "lastIndexOf"
@bs.send external lastIndexOfFrom: (array<'a>, 'a, ~from: int) => int = "lastIndexOf"

@bs.send external slice: (array<'a>, ~from: int, ~end: int) => array<'a> = "slice"
@bs.send external sliceToEnd: (array<'a>, ~from: int) => array<'a> = "slice"
@bs.send external copy: array<'a> => array<'a> = "slice"

@bs.send external toString: array<'a> => string = "toString"
@bs.send external toLocaleString: array<'a> => string = "toLocaleString"

@bs.send external every: (array<'a>, 'a => bool) => bool = "every"
@bs.send external everyWithIndex: (array<'a>, ('a, int) => bool) => bool = "every"

@bs.send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"
@bs.send external filterWithIndex: (array<'a>, ('a, int) => bool) => array<'a> = "filter"

@bs.send external find: (array<'a>, 'a => bool) => option<'a> = "find"
@bs.send external findWithIndex: (array<'a>, ('a, int) => bool) => option<'a> = "find"

@bs.send external findIndex: (array<'a>, 'a => bool) => int = "findIndex"
@bs.send external findIndexWithIndex: (array<'a>, ('a, int) => bool) => int = "findIndex"

@bs.send external forEach: (array<'a>, 'a => unit) => unit = "forEach"
@bs.send external forEachWithIndex: (array<'a>, ('a, int) => unit) => unit = "forEach"

@bs.send external map: (array<'a>, 'a => 'b) => array<'b> = "forEach"
@bs.send external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "forEach"

@bs.send external reduce: (array<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduce"
@bs.send external reduceWithIndex: (array<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduce"

@bs.send external reduceRight: (array<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
@bs.send external reduceRightWithIndex: (array<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"

@bs.send external some: (array<'a>, 'a => bool) => bool = "some"
@bs.send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

@bs.get_index external get: (array<'a>, int) => option<'a> = ""
@bs.set_index external set: (array<'a>, int, 'a) => unit = ""

@bs.get_index external getSymbol: (array<'a>, Js__Symbol.t<'b>) => option<'a> = ""
@bs.set_index external setSymbol: (array<'a>, Js__Symbol.t<'b>, 'b) => unit = ""
