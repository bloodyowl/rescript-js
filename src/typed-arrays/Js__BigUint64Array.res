type t = Js__TypedArray.t<Js__BigInt.t>

module Constants = {
  @bs.val external bytesPerElement: int = "BigUint64Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "BigUint64Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "BigUint64Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "BigUint64Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigUint64Array"
@bs.new external fromLength: int => t = "BigUint64Array"
@bs.val external from: 'a => t = "BigUint64Array.from"
