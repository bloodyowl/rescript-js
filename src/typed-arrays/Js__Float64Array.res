type t = Js__TypedArray.t<float>

module Constants = {
  @bs.val external bytesPerElement: int = "Float64Array.BYTES_PER_ELEMENT"
}

@bs.new external make: array<float> => t = "Float64Array"
@bs.new external fromBuffer: Js__ArrayBuffer.t => t = "Float64Array"
@bs.new external fromBufferToEnd: (Js__ArrayBuffer.t, ~byteOffset: int) => t = "Float64Array"
@bs.new
external fromBufferWithRange: (Js__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Float64Array"
@bs.new external fromLength: int => t = "Float64Array"
@bs.val external from: 'a => t = "Float64Array.from"
