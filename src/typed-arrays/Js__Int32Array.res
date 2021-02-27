type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Int32Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Int32Array"
@new external fromBuffer: Js__ArrayBuffer.t => t = "Int32Array"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "Int32Array"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Int32Array"
@new external fromLength: int => t = "Int32Array"
@val external from: 'a => t = "Int32Array.from"
