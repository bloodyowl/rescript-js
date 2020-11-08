type t<'a>

@bs.get_index external get: (t<'a>, int) => option<'a> = ""
@bs.set_index external set: (t<'a>, int, 'a) => unit = ""

@bs.get external buffer: t<'a> => Js__ArrayBuffer.t = "buffer"
@bs.get external byteLength: t<'a> => int = "byteLength"
@bs.get external byteOffset: t<'a> => int = "byteOffset"

@bs.send external setArray: (t<'a>, array<'a>) => unit = "set"
@bs.send external setArrayFrom: (t<'a>, array<'a>, ~from: int) => unit = "set"

@bs.get external length: t<'a> => int = "length"

@bs.send external copyAllWithin: (t<'a>, ~target: int) => array<'a> = "copyWithin"
@bs.send external copyWithinToEnd: (t<'a>, ~target: int, ~start: int) => array<'a> = "copyWithin"
@bs.send
external copyWithin: (t<'a>, ~target: int, ~start: int, ~end: int) => array<'a> = "copyWithin"

@bs.send external fillAllInPlace: (t<'a>, 'a) => t<'a> = "fill"
@bs.send external fillInPlaceToEnd: (t<'a>, 'a, ~start: int) => t<'a> = "fill"
@bs.send external fillInPlace: (t<'a>, 'a, ~start: int, ~end: int) => t<'a> = "fill"

@bs.send external reverseInPlace: t<'a> => t<'a> = "reverse"
@bs.send external sortInPlace: (t<'a>, ('a, 'a) => int) => t<'a> = "sort"

@bs.send external includes: (t<'a>, 'a) => bool = "includes"

@bs.send external indexOf: (t<'a>, 'a) => int = "indexOf"
@bs.send external indexOfFrom: (t<'a>, 'a, ~from: int) => int = "indexOf"

@bs.send external joinWith: (t<'a>, string) => string = "join"

@bs.send external lastIndexOf: (t<'a>, 'a) => int = "lastIndexOf"
@bs.send external lastIndexOfFrom: (t<'a>, 'a, ~from: int) => int = "lastIndexOf"

@bs.send external slice: (t<'a>, ~from: int, ~end: int) => t<'a> = "slice"
@bs.send external sliceToEnd: (t<'a>, ~from: int) => t<'a> = "slice"
@bs.send external copy: t<'a> => t<'a> = "slice"

@bs.send external subarray: (t<'a>, ~from: int, ~end: int) => t<'a> = "subarray"
@bs.send external subarrayToEnd: (t<'a>, ~from: int) => t<'a> = "subarray"

@bs.send external toString: t<'a> => string = "toString"
@bs.send external toLocaleString: t<'a> => string = "toLocaleString"

@bs.send external every: (t<'a>, 'a => bool) => bool = "every"
@bs.send external everyWithIndex: (t<'a>, ('a, int) => bool) => bool = "every"

@bs.send external filter: (t<'a>, 'a => bool) => t<'a> = "filter"
@bs.send external filterWithIndex: (t<'a>, ('a, int) => bool) => t<'a> = "filter"

@bs.send external find: (t<'a>, 'a => bool) => option<'a> = "find"
@bs.send external findWithIndex: (t<'a>, ('a, int) => bool) => option<'a> = "find"

@bs.send external findIndex: (t<'a>, 'a => bool) => int = "findIndex"
@bs.send external findIndexWithIndex: (t<'a>, ('a, int) => bool) => int = "findIndex"

@bs.send external forEach: (t<'a>, 'a => unit) => unit = "forEach"
@bs.send external forEachWithIndex: (t<'a>, ('a, int) => unit) => unit = "forEach"

@bs.send external map: (t<'a>, 'a => 'b) => t<'b> = "map"
@bs.send external mapWithIndex: (t<'a>, ('a, int) => 'b) => t<'b> = "map"

@bs.send external reduce: (t<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduce"
@bs.send external reduceWithIndex: (t<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduce"

@bs.send external reduceRight: (t<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
@bs.send external reduceRightWithIndex: (t<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"

@bs.send external some: (t<'a>, 'a => bool) => bool = "some"
@bs.send external someWithIndex: (t<'a>, ('a, int) => bool) => bool = "some"
