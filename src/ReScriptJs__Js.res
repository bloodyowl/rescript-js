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
module Promise = Promise
module RegExp = Js__RegExp
module String = Js__String
module Undefined = Js__Undefined
module Symbol = Js__Symbol
module Type = Js__Type
module JSON = Js__JSON

module Iterator = Js__Iterator
module AsyncIterator = Js__AsyncIterator
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

module Intl = Js__Intl

module Serializer = Js__Serializer

@val external window: {..} = "window"
@val external document: {..} = "document"
@val external globalThis: {..} = "globalThis"

external null: Js__Null.t<'a> = "#null"
external undefined: Js__Undefined.t<'a> = "#undefined"
external typeof: 'a => Js__Type.t = "#typeof"

include Js__Global

type t<'a> = Js.t<'a>
module Fn = Js.Fn
module MapperRt = Js.MapperRt
module Internal = Js.Internal
module Re = Js__RegExp // needed for the %re sugar

type null<+'a> = Js.null<'a>

type undefined<+'a> = Js.undefined<'a>

type nullable<+'a> = Js.nullable<'a>
