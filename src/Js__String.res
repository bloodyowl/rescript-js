@bs.val external make: 'a => string = "String"

@bs.val external fromCharCode: int => string = "String.fromCharCode"
@bs.variadic @bs.val external fromCharCodeMany: array<int> => string = "String.fromCharCode"

@bs.val external fromCodePoint: int => string = "String.fromCodePoint"
@bs.variadic @bs.val external fromCodePointMany: array<int> => string = "String.fromCodePoint"

@bs.get external length: string => int = "length"
@bs.get_index external get: (string, int) => option<string> = ""
@bs.send external charAt: (string, int) => string = "charAt"

@bs.send external charCodeAt: (string, int) => float = "charCodeAt"
@bs.send external codePointAt: (string, int) => option<int> = "codePointAt"

@bs.send external concat: (string, string) => string = "concat"
@bs.variadic @bs.send external concatMany: (string, array<string>) => string = "concat"

@bs.send external endsWith: (string, string) => bool = "endsWith"
@bs.send external endsWithFrom: (string, string, ~from: int) => bool = "endsWith"

@bs.send external includes: (string, string) => bool = "includes"
@bs.send external includesFrom: (string, string, ~from: int) => bool = "includes"

@bs.send external indexOf: (string, string) => int = "indexOf"
@bs.send external indexOfFrom: (string, string, ~from: int) => int = "indexOf"

@bs.send external lastIndexOf: (string, string) => int = "lastIndexOf"
@bs.send external lastIndexOfFrom: (string, string, ~from: int) => int = "lastIndexOf"

@bs.send external match: (string, Js__RegExp.t) => Js__RegExp.Result.t = "match"

type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]
@bs.send external normalize: string => string = "normalize"
@bs.send external normalizeByForm: (string, normalizeForm) => string = "normalize"

@bs.send external repeat: (string, int) => string = "repeat"

@bs.send external replaceString: (string, string, string) => string = "replace"
@bs.send external replaceRegExp: (string, Js__RegExp.t, string) => string = "replace"

@bs.send
external unsafeReplaceRegExpBy0: (
  string,
  Js__RegExp.t,
  (@bs.uncurry ~match: string, ~offset: int, ~input: string) => string,
) => string = "replace"

@bs.send
external unsafeReplaceRegExpBy1: (
  string,
  Js__RegExp.t,
  (@bs.uncurry ~match: string, ~group1: string, ~offset: int, ~input: string) => string,
) => string = "replace"

@bs.send
external unsafeReplaceRegExpBy2: (
  string,
  Js__RegExp.t,
  (
    @bs.uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"

@bs.send
external unsafeReplaceRegExpBy3: (
  string,
  Js__RegExp.t,
  (
    @bs.uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~group3: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"

@bs.send external search: (string, Js__RegExp.t) => int = "search"

@bs.send external slice: (string, ~start: int, ~end: int) => string = "slice"
@bs.send external sliceToEnd: (string, ~start: int) => string = "slice"

@bs.send external split: (string, string) => array<string> = "split"
@bs.send external splitAtMost: (string, string, ~limit: int) => array<string> = "split"
@bs.send external splitByRegExp: (string, Js__RegExp.t) => array<option<string>> = "split"
@bs.send
external splitByRegExpAtMost: (string, Js__RegExp.t, ~limit: int) => array<option<string>> = "split"

@bs.send external startsWith: (string, string) => bool = "startsWith"
@bs.send external startsWithFrom: (string, string, ~from: int) => bool = "startsWith"

@bs.send external substr: (string, ~start: int, ~length: int) => string = "substr"
@bs.send external substrToEnd: (string, ~start: int) => string = "substr"

@bs.send external substring: (string, ~start: int, ~end: int) => string = "substring"
@bs.send external substringToEnd: (string, ~start: int) => string = "substring"

@bs.send external toLowerCase: string => string = "toLowerCase"
@bs.send external toLocaleLowerCase: string => string = "toLocaleLowerCase"
@bs.send external toUpperCase: string => string = "toUpperCase"
@bs.send external toLocaleUpperCase: string => string = "toLocaleUpperCase"

@bs.send external trim: string => string = "trim"

@bs.get_index external getSymbol: (string, Js__Symbol.t) => option<'a> = ""
@bs.get_index external getSymbolUnsafe: (string, Js__Symbol.t) => 'a = ""
@bs.set_index external setSymbol: (string, Js__Symbol.t, 'a) => unit = ""
