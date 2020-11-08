type t

@bs.val external asIntN: (~width: int, t) => t = "BigInt.asIntN"
@bs.val external asUintN: (~width: int, t) => t = "BigInt.asUintN"

@bs.val external fromString: string => t = "BigInt"
@bs.val external fromInt: int => t = "BigInt"
@bs.val external fromFloat: float => t = "BigInt"

@bs.send external toString: t => string = "toString"
@bs.send external toStringWithRadix: (t, ~radix: int) => string = "toString"
@bs.send external toLocaleString: t => string = "toLocaleString"

external \"+": (t, t) => t = "%addfloat"
external \"-": (t, t) => t = "%subfloat"
external \"*": (t, t) => t = "%mulfloat"
external \"/": (t, t) => t = "%divfloat"

external add: (t, t) => t = "%addfloat"
external sub: (t, t) => t = "%subfloat"
external mul: (t, t) => t = "%mulfloat"
external div: (t, t) => t = "%divfloat"
