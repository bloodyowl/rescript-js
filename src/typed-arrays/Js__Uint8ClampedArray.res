type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "UInt8ClampedArray.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "UInt8ClampedArray"
@new external fromBuffer: Js__ArrayBuffer.t => t = "UInt8ClampedArray"
@new
external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "UInt8ClampedArray"
@new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "UInt8ClampedArray"
@new external fromLength: int => t = "UInt8ClampedArray"
@val external from: 'a => t = "UInt8ClampedArray.from"
