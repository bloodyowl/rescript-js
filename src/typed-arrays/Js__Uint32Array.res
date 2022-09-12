// Float instead of int because not all uint32s fit in int32
type t = Js__TypedArray.t<float>

module Constants = {
  @val external bytesPerElement: int = "Uint32Array.BYTES_PER_ELEMENT"
}

@new external make: array<float> => t = "Uint32Array"
@new external fromBuffer: array<Js__ArrayBuffer.t> => t = "Uint32Array"
@new external fromBufferToEnd: (array<Js__ArrayBuffer.t>, ~start: int) => t = "Uint32Array"
@new
external fromBufferWithRange: (array<Js__ArrayBuffer.t>, ~start: int, ~end: int) => t =
  "Uint32Array"
@new external fromLength: int => t = "Uint32Array"
@val external from: 'a => t = "Uint32Array.from"
