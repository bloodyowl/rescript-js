type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Int16Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Int16Array"
@new external fromBuffer: Js__ArrayBuffer.t => t = "Int16Array"
@new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "Int16Array"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Int16Array"
@new external fromLength: int => t = "Int16Array"
@val external from: 'a => t = "Int16Array.from"
