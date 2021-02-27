type t = Js__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "UInt32Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "UInt32Array"
@new external fromBuffer: array<Js__ArrayBuffer.t> => t = "UInt32Array"
@new external fromBufferToEnd: (array<Js__ArrayBuffer.t>, ~start: int) => t = "UInt32Array"
@new
external fromBufferWithRange: (array<Js__ArrayBuffer.t>, ~start: int, ~end: int) => t =
  "UInt32Array"
@new external fromLength: int => t = "UInt32Array"
@val external from: 'a => t = "UInt32Array.from"
