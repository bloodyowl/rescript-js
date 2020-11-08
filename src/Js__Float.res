module Constants = {
  @bs.val external nan: float = "NaN"
  @bs.val external epsilon: float = "Number.EPSILON"
  @bs.val external positiveInfinity: float = "Number.POSITIVE_INFINITY"
  @bs.val external negativeInfinity: float = "Number.NEGATIVE_INFINITY"
  @bs.val external minValue: float = "Number.MIN_VALUE"
  @bs.val external maxValue: float = "Number.MAX_VALUE"
}

@bs.val external isNaN: float => bool = "isNaN"
@bs.val external isFinite: float => bool = "isFinite"
@bs.val external parseFloat: 'a => float = "parseFloat"
@bs.val external parseInt: 'a => float = "parseInt"
@bs.val external parseIntWithRadix: ('a, ~radix: int) => float = "parseInt"

@bs.send external toExponential: float => string = "toExponential"
@bs.send external toExponentialWithPrecision: (float, ~digits: int) => string = "toExponential"

@bs.send external toFixed: float => string = "toFixed"
@bs.send external toFixedWithPrecision: (float, ~digits: int) => string = "toFixed"

@bs.send external toPrecision: float => string = "toPrecision"
@bs.send external toPrecisionWithPrecision: (float, ~digits: int) => string = "toPrecision"

@bs.send external toString: float => string = "toString"
@bs.send external toStringWithRadix: (float, ~radix: int) => string = "toString"
@bs.send external toLocaleString: float => string = "toLocaleString"

@bs.send external fromString: string => float = "Number"
