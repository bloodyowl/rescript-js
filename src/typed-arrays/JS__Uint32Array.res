type t = Js__TypedArray.t<int>

module Constants = {
  @bs.val external bytesPerElement: int = "UInt32Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "UInt32Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "UInt32Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt32Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt32Array"
@bs.new external fromLength: int => t = "UInt32Array"
@bs.val external from: 'a => t = "UInt32Array.from"
