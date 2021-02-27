type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "UInt16Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "UInt16Array"
@new external fromBuffer: Js__ArrayBuffer.t => t = "UInt16Array"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt16Array"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt16Array"
@new external fromLength: int => t = "UInt16Array"
@val external from: 'a => t = "UInt16Array.from"
