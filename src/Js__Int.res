module Constants = {
  @bs.inline let minValue = -2147483648
  @bs.inline let maxValue = 2147483647
}

@bs.send external toExponential: int => string = "toExponential"
@bs.send external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@bs.send external toFixed: int => string = "toFixed"
@bs.send external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@bs.send external toPrecision: int => string = "toPrecision"
@bs.send external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@bs.send external toString: int => string = "toString"
@bs.send external toStringWithRadix: (int, ~radix: int) => string = "toString"
@bs.send external toLocaleString: int => string = "toLocaleString"

@bs.send external fromString: string => int = "Number"
