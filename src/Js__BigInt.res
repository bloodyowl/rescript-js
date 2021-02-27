type t

@val external asIntN: (~width: int, t) => t = "BigInt.asIntN"
@val external asUintN: (~width: int, t) => t = "BigInt.asUintN"

@val external fromString: string => t = "BigInt"
@val external fromInt: int => t = "BigInt"
@val external fromFloat: float => t = "BigInt"

@send external toString: t => string = "toString"
@send external toStringWithRadix: (t, ~radix: int) => string = "toString"
@send external toLocaleString: t => string = "toLocaleString"

external \"+": (t, t) => t = "%addfloat"
external \"-": (t, t) => t = "%subfloat"
external \"*": (t, t) => t = "%mulfloat"
external \"/": (t, t) => t = "%divfloat"

external add: (t, t) => t = "%addfloat"
external sub: (t, t) => t = "%subfloat"
external mul: (t, t) => t = "%mulfloat"
external div: (t, t) => t = "%divfloat"
