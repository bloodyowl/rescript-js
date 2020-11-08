type t = Js__TypedArray.t<int>

module Constants = {
  @bs.val external bytesPerElement: int = "Uint8ClampedArray.BYTES_PER_ELEMENT"
}

@bs.new external make: array<int> => t = "Uint8ClampedArray"
@bs.new external fromBuffer: array<Js__ArrayBuffer.t> => t = "Uint8ClampedArray"
@bs.new
external fromBufferToEnd: (array<Js__ArrayBuffer.t>, ~start: int) => t = "Uint8ClampedArray"
@bs.new
external fromBufferWithRange: (array<Js__ArrayBuffer.t>, ~start: int, ~end: int) => t =
  "Uint8ClampedArray"
@bs.new external fromLength: int => t = "Uint8ClampedArray"
@bs.val external from: 'a => t = "Uint8ClampedArray.from"
