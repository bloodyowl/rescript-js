module Js = {
  module Array = Js__Array
  module Console = Js__Console
  module Date = Js__Date
  module Dict = Js__Dict
  module Error = Js__Error
  module Float = Js__Float
  module Global = Js__Global
  module Int = Js__Int
  module BigInt = Js__BigInt
  module Math = Js__Math
  module Null = Js__Null
  module Nullable = Js__Nullable
  module Object = Js__Object
  module Promise = Js__Promise
  module RegExp = Js__RegExp
  module String = Js__String
  module Undefined = Js__Undefined
  module Type = Js__Type

  module Iterator = Js__Iterator
  module Map = Js__Map
  module WeakMap = Js__WeakMap
  module Set = Js__Set
  module WeakSet = Js__WeakSet

  module ArrayBuffer = Js__ArrayBuffer
  module TypedArray = Js__TypedArray
  module Float32Array = Js__Float32Array
  module Float64Array = Js__Float64Array
  module Int8Array = Js__Int8Array
  module Int16Array = Js__Int16Array
  module Int32Array = Js__Int32Array
  module Uint8Array = Js__Uint8Array
  module Uint16Array = Js__Uint16Array
  module Uint32Array = Js__Uint32Array
  module Uint8ClampedArray = Js__Uint8ClampedArray
  module BigInt64Array = Js__BigInt64Array
  module BigUint64Array = Js__BigUint64Array

  module Serializer = Js__Serializer

  @bs.val external window: {..} = "window"
  @bs.val external document: {..} = "document"
}
