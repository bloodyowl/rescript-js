open FastCheck.Arbitrary
open ReScriptJs.Js

let rawInt8Arb = () => integerRange(-128, 127)
let int8Arb = () => rawInt8Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.Int8)))
let rawUInt8Arb = () => integerRange(0, 255)
let uInt8Arb = () => rawUInt8Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.UInt8)))
let rawInt16Arb = () => integerRange(-32768, 32767)
let int16Arb = () => rawInt16Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.Int16)))
let rawUInt16Arb = () => integerRange(0, 65535)
let uInt16Arb = () => rawUInt16Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.UInt16)))
let rawUInt32Arb = () => floatRange(0.0, 4294967295.0)->Derive.map(Js.Math.round)
let uInt32Arb = () => rawUInt32Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.UInt32)))
let rawUInt64Arb = () =>
  Combinators.tuple2(rawUInt32Arb(), rawUInt32Arb())->Derive.map(((
    mostSignificant,
    leastSignificant,
  )) => {
    open BigInt
    fromFloat(mostSignificant)->BigInt.lsl(fromInt(32))->add(fromFloat(leastSignificant))
  })
let uInt64Arb = () => rawUInt64Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.UInt64)))
let rawInt64Arb = () =>
  rawUInt64Arb()->Derive.map(bits => {
    open BigInt
    let absMinInt64 = fromInt(1)->BigInt.lsl(fromInt(63)) // 2**63
    bits->sub(absMinInt64)
  })
let int64Arb = () => rawInt64Arb()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.Int64)))
let float32Arb = () => float_()->Derive.map(ConstrainedType.Value.makeExn(~constraint_=module(DataView.Float32)))

let uint8ArrayArb = (~minSize, ~maxSize) => Combinators.arrayWithLength(rawUInt8Arb(), minSize, maxSize)->Derive.map(Uint8Array.make)

let bufferArb = (~minSize, ~maxSize) => {
  uint8ArrayArb(~minSize, ~maxSize)->Derive.map(TypedArray.buffer)
}

let dataviewArb = (~minSize, ~maxSize) => {
  bufferArb(~minSize, ~maxSize)->Derive.map(DataView.fromBuffer)
}