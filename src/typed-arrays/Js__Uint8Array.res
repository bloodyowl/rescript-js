type t = Js__TypedArray.t<int>

module Constants = {
  @bs.val external bytesPerElement: int = "UInt8Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "UInt8Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "UInt8Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt8Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt8Array"
@bs.new external fromLength: int => t = "UInt8Array"
@bs.val external from: 'a => t = "UInt8Array.from"
