open ConstrainedType

type t

@new external fromBuffer: Js__ArrayBuffer.t => t = "DataView"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "DataView"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t = "DataView"

@get external buffer: t => Js__ArrayBuffer.t = "buffer"
@get external byteLength: t => int = "byteLength"
@get external byteOffset: t => int = "byteOffset"

module UInt8 = Constraint.MakeU({
  type t = int
  let isSatisfied = (. value) => 0 <= value && value <= 255
})
module Int8 = Constraint.MakeU({
  type t = int
  let isSatisfied = (. value) => -128 <= value && value <= 127
})
module UInt16 = Constraint.MakeU({
  type t = int
  let isSatisfied = (. value) => 0 <= value && value <= 65535
})
module Int16 = Constraint.MakeU({
  type t = int
  let isSatisfied = (. value) => -32768 <= value && value <= 32767
})
module UInt32 = Constraint.MakeU({
  // We use a float instead of an int since a uint32 can hold 
  // any value between 0 and 4,294,967,295. While int can only hold values
  // between -2,147,483,648 and 2,147,483,647.
  type t = float
  let isInt = (.value) => Js.Math.round(value) == value
  let isSatisfied = (. value) => 0.0 <= value && value <= 4294967295.0 && isInt(. value)
})
module UInt64 = Constraint.MakeU({
  type t = Js__BigInt.t
  let maxValue = Js__BigInt.fromString("18446744073709551615")
  let minValue = Js__BigInt.fromFloat(0.0)
  let isSatisfied = (. value) => minValue->Js__BigInt.le(value) && value->Js__BigInt.le(maxValue)
})
module Int64 = Constraint.MakeU({
  type t = Js__BigInt.t
  let maxValue = Js__BigInt.fromString("9223372036854775807")
  let minValue = Js__BigInt.fromString("-9223372036854775808")
  let isSatisfied = (. value) => minValue->Js__BigInt.le(value) && value->Js__BigInt.le(maxValue)
})
module Float32 = Constraint.MakeU({
  type t = float
  // Since NaN != NaN, we must check Js.Float.isNaN seperatley 
  let isSatisfied = (. value) => Js.Math.fround(value) == value || Js.Float.isNaN(value)
})

@send external getInt8Raw: (t, int) => int = "getInt8"
@send external getInt8: (t, int) => Value.t<int, Int8.identity> = "getInt8"

@send external getUint8Raw: (t, int) => int = "getUint8"
@send external getUint8: (t, int) => Value.t<int, UInt8.identity> = "getUint8"

@send external getInt16Raw: (t, int) => int = "getInt16"
@send external getInt16: (t, int) => Value.t<int, Int16.identity> = "getInt16"

@send external getUint16Raw: (t, int) => int = "getUint16"
@send external getUint16: (t, int) => Value.t<int, UInt16.identity> = "getUint16"

// No getInt32Raw since all valid int values are valid int32 values
@send external getInt32: (t, int) => int = "getInt32"

/**
@return A float representing the given range.

We return a float instead of an int since a uint32 can hold 
any value between 0 and 4,294,967,295. While int can only hold values
between -2,147,483,648 and 2,147,483,647.
*/
@send external getUint32Raw: (t, int) => float = "getUint32"
@send external getUint32: (t, int) => Value.t<float, UInt32.identity> = "getUint32"

@send external getFloat32Raw: (t, int) => float = "getFloat32"
@send external getFloat32: (t, int) => Value.t<float, Float32.identity> = "getFloat32"

// No getFloat64Raw since all valid float values are valid Float64 values
@send external getFloat64: (t, int) => float = "getFloat64"

@send external getBigInt64Raw: (t, int) => Js__BigInt.t = "getBigInt64"
@send external getBigInt64: (t, int) => Value.t<Js__BigInt.t, Int64.identity> = "getBigInt64"

@send external getBigUint64Raw: (t, int) => Js__BigInt.t = "getBigUint64"
@send external getBigUint64: (t, int) => Value.t<Js__BigInt.t, UInt64.identity> = "getBigUint64"

@send external setInt8Truncated: (t, int, int) => unit = "setInt8"
@send external setInt8: (t, int, Value.t<int, Int8.identity>) => unit = "setInt8"

@send external setUint8Truncated: (t, int, int) => unit = "setUint8"
@send external setUint8: (t, int, Value.t<int, UInt8.identity>) => unit = "setUint8"

@send external setInt16Truncated: (t, int, int) => unit = "setInt16"
@send external setInt16: (t, int, Value.t<int, Int16.identity>) => unit = "setInt16"

@send external setUint16Truncated: (t, int, int) => unit = "setUint16"
@send external setUint16: (t, int, Value.t<int, UInt16.identity>) => unit = "setUint16"

// No setInt32Truncated since all valid int values are valid int32 values
@send external setInt32: (t, int, int) => unit = "setInt32"

/**
@param dataview
@param offset
@param value

We take a float value instead of of an int since a uint32 can hold 
any value between 0 and 4,294,967,295. While int can only hold values
between -2,147,483,648 and 2,147,483,647.
*/
@send external setUint32Truncated: (t, int, float) => unit = "setUint32"
@send external setUint32: (t, int, Value.t<float, UInt32.identity>) => unit = "setUint32"

@send external setFloat32Rounded: (t, int, float) => unit = "setFloat32"
@send external setFloat32: (t, int, Value.t<float, Float32.identity>) => unit = "setFloat32"

// No setFloat64Truncated since all valid float values are valid float64 values
@send external setFloat64: (t, int, float) => unit = "setFloat64"

@send external setBigInt64Truncated: (t, int, Js__BigInt.t) => unit = "setBigInt64"
@send external setBigInt64: (t, int, Value.t<Js__BigInt.t, Int64.identity>) => unit = "setBigInt64"

@send external setBigUint64Truncated: (t, int, Js__BigInt.t) => unit = "setBigUint64"
@send external setBigUint64: (t, int, Value.t<Js__BigInt.t, UInt64.identity>) => unit = "setBigUint64"
