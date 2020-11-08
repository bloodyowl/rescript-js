type t

@bs.val external make: string => t = "Symbol"
@bs.val external getFor: string => t = "Symbol.for"
@bs.val external keyFor: t => option<string> = "Symbol.keyFor"

@bs.val external asyncIterator: t = "Symbol.asyncIterator"
@bs.val external hasInstance: t = "Symbol.hasInstance"
@bs.val external isConcatSpreadable: t = "Symbol.isConcatSpreadable"
@bs.val external iterator: t = "Symbol.iterator"
@bs.val external match: t = "Symbol.match"
@bs.val external matchAll: t = "Symbol.matchAll"
@bs.val external replace: t = "Symbol.replace"
@bs.val external search: t = "Symbol.search"
@bs.val external species: t = "Symbol.species"
@bs.val external split: t = "Symbol.split"
@bs.val external toPrimitive: t = "Symbol.toPrimitive"
@bs.val external toStringTag: t = "Symbol.toStringTag"
@bs.val external unscopables: t = "Symbol.unscopables"
