type t<'a>

@bs.val external make: string => t<'a> = "Symbol"
@bs.val external makeShared: string => t<'a> = "Symbol.for"
@bs.val external keyFor: t<'a> => option<string> = "Symbol.keyFor"

@bs.val external asyncIterator: t<unit => Js__AsyncIterator.t<'a>> = "Symbol.asyncIterator"
@bs.val external hasInstance: t<'a => bool> = "Symbol.hasInstance"
@bs.val external isConcatSpreadable: t<bool> = "Symbol.isConcatSpreadable"
@bs.val external iterator: t<unit => Js__Iterator.t<'a>> = "Symbol.iterator"
@bs.val external match: t<bool> = "Symbol.match"
@bs.val external matchAll: t<string => Js__Iterator.t<string>> = "Symbol.matchAll"
@bs.val external replace: t<string => string> = "Symbol.replace"
@bs.val external search: t<string => int> = "Symbol.search"
@bs.val external species: t<unit => 'a> = "Symbol.species"
@bs.val external split: t<string => array<string>> = "Symbol.split"
@bs.val external toPrimitive: t<'a => 'b> = "Symbol.toPrimitive"
@bs.val external toStringTag: t<unit => string> = "Symbol.toStringTag"
@bs.val external unscopables: t<unit => Js__Dict.t<bool>> = "Symbol.unscopables"
