type t

@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "DataView"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "DataView"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t = "DataView"

@bs.get external buffer: t => Js__ArrayBuffer.t = "buffer"
@bs.get external byteLength: t => int = "byteLength"
@bs.get external byteOffset: t => int = "byteOffset"

@bs.send external getInt8: t => int = "getInt8"
@bs.send external getUint8: t => int = "getUint8"
@bs.send external getInt16: t => int = "getInt16"
@bs.send external getUint16: t => int = "getUint16"
@bs.send external getInt32: t => int = "getInt32"
@bs.send external getUint32: t => int = "getUint32"

@bs.send external getFloat32: t => float = "getFloat32"
@bs.send external getFloat64: t => float = "getFloat64"

@bs.send external getBigInt64: t => Js__BigInt.t = "getBigInt64"
@bs.send external getBigUint64: t => Js__BigInt.t = "getBigUint64"

@bs.send external setInt8: (t, int) => unit = "setInt8"
@bs.send external setUint8: (t, int) => unit = "setUint8"
@bs.send external setInt16: (t, int) => unit = "setInt16"
@bs.send external setUint16: (t, int) => unit = "setUint16"
@bs.send external setInt32: (t, int) => unit = "setInt32"
@bs.send external setUint32: (t, int) => unit = "setUint32"

@bs.send external setFloat32: (t, float) => unit = "setFloat32"
@bs.send external setFloat64: (t, float) => unit = "setFloat64"

@bs.send external setBigInt64: (t, Js__BigInt.t) => unit = "setBigInt64"
@bs.send external setBigUint64: (t, Js__BigInt.t) => unit = "setBigUint64"
