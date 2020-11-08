type t = Js.TypedArray2.ArrayBuffer.t

@bs.new external make: int => t = "ArrayBuffer"
@bs.get external byteLength: t => int = "byteLength"

@bs.send external slice: (t, ~start: int, ~end: int) => t = "slice"
@bs.send external sliceToEnd: (t, ~start: int) => t = "slice"
