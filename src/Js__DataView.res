type t

@new external fromBuffer: Js__ArrayBuffer.t => t = "DataView"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "DataView"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t = "DataView"

@get external buffer: t => Js__ArrayBuffer.t = "buffer"
@get external byteLength: t => int = "byteLength"
@get external byteOffset: t => int = "byteOffset"

@send external getInt8: (t, int) => int = "getInt8"
@send external getUint8: (t, int) => int = "getUint8"
@send external getInt16: (t, int) => int = "getInt16"
@send external getUint16: (t, int) => int = "getUint16"
@send external getInt32: (t, int) => int = "getInt32"
/**
@return A float representing the given range.

We return a float instead of an int since a uint32 can hold 
any value between 0 and 4,294,967,295. While int can only old values
between -2,147,483,648 and 2,147,483,647.
*/
@send external getUint32: (t, int) => float = "getUint32"

@send external getFloat32: (t, int) => float = "getFloat32"
@send external getFloat64: (t, int) => float = "getFloat64"

@send external getBigInt64: (t, int) => Js__BigInt.t = "getBigInt64"
@send external getBigUint64: (t, int) => Js__BigInt.t = "getBigUint64"

@send external setInt8: (t, int, int) => unit = "setInt8"
@send external setUint8: (t, int, int) => unit = "setUint8"
@send external setInt16: (t, int, int) => unit = "setInt16"
@send external setUint16: (t, int, int) => unit = "setUint16"
@send external setInt32: (t, int, int) => unit = "setInt32"
/**
@param dataview
@param offset
@param value

We take a float value instead of of an int since a uint32 can hold 
any value between 0 and 4,294,967,295. While int can only old values
between -2,147,483,648 and 2,147,483,647.
*/
@send external setUint32: (t, int, float) => unit = "setUint32"

@send external setFloat32: (t, int, float) => unit = "setFloat32"
@send external setFloat64: (t, int, float) => unit = "setFloat64"

@send external setBigInt64: (t, int, Js__BigInt.t) => unit = "setBigInt64"
@send external setBigUint64: (t, int, Js__BigInt.t) => unit = "setBigUint64"
