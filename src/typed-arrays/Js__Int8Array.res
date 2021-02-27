type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Int8Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Int8Array"
@new external fromBuffer: Js__ArrayBuffer.t => t = "Int8Array"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "Int8Array"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t = "Int8Array"
@new external fromLength: int => t = "Int8Array"
@val external from: 'a => t = "Int8Array.from"
