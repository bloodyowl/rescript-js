type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "UInt8Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "UInt8Array"
@new external fromBuffer: Js__ArrayBuffer.t => t = "UInt8Array"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt8Array"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt8Array"
@new external fromLength: int => t = "UInt8Array"
@val external from: 'a => t = "UInt8Array.from"
