open Jest
open FastCheck
open Expect
open Property.SyncUnit
open Arbitrary
open ReScriptJs.Js
open DataView

let bufferArb = (~minSize, ~maxSize) => {
  integerRange(minSize, maxSize)->Derive.map(size => ArrayBuffer.make(size))
}

let dataviewArb = (~minSize, ~maxSize) => {
  bufferArb(~minSize, ~maxSize)->Derive.map(fromBuffer)  
}

let rawInt8Arb = () => integerRange(-128, 127)
let rawUInt8Arb = () => integerRange(0, 255)
let rawInt16Arb = () => integerRange(-32768, 32767)
let rawUInt16Arb = () => integerRange(0, 65535)
let rawUInt32Arb = () => floatRange(0.0, 4294967295.0)->Derive.map(Js.Math.round)
let rawUInt64Arb = () => Combinators.tuple2(rawUInt32Arb(), rawUInt32Arb())->Derive.map(((mostSignificant, leastSignificant)) => {
  open BigInt
  fromFloat(mostSignificant)->BigInt.lsl(fromInt(32))->add(fromFloat(leastSignificant))
})
let rawInt64Arb = () => rawUInt64Arb()->Derive.map(bits => {
  open BigInt
  let absMinInt64 = fromInt(1)->BigInt.lsl(fromInt(63)) // 2**63
  bits->sub(absMinInt64)
})

let getFetchesSet = (
  ~testName: string = "Get fetches set", 
  get: (DataView.t, int) => 'v, 
  set: (DataView.t, int, 'v) => unit,
  valueArb: arbitrary<'v>,
  valueBitSize: int
) => {
  let valueByteSize = valueBitSize / 8
  let maxDataviewSize = 1000
  test(testName, () => {
    assert_(
      property1(
        dataviewArb(~minSize=valueByteSize, ~maxSize=maxDataviewSize)->Derive.chain(dataview => {
          let setIndexArb = integerRange(0, dataview->byteLength - valueByteSize)
          Combinators.tuple3(Combinators.constant(dataview), setIndexArb, valueArb)
        }),
        ((dataview, setIndex, value)) => {
          set(dataview, setIndex, value)
          let getValue = get(dataview, setIndex)
          expect(getValue)->toEqual(value)->affirm
        }
      )
    )
    pass
  })
}

describe("fromBuffer", () => {
  test("Doesn't throw", () => {
    let buffer = ArrayBuffer.make(6)
    let dataview = fromBuffer(buffer)
    dataview->ignore
    pass
  })
})
describe("fromBufferToEnd", () => {
  test("Doesn't throw", () => {
    let buffer = ArrayBuffer.make(6)
    let dataview = fromBufferToEnd(buffer, ~byteOffset=3)
    dataview->ignore
    pass
  })
})
describe("fromBufferWithRange", () => {
  test("Doesn't throw", () => {
    let buffer = ArrayBuffer.make(6)
    let dataview = fromBufferWithRange(buffer, ~byteOffset=3, ~length=2)
    dataview->ignore
    pass
  })
})
describe("buffer", () => {
  test("Inverts fromBuffer", () => {
    let maxBufferSize = 1000
    assert_(
      property1(
        bufferArb(~minSize=0, ~maxSize=maxBufferSize),
        (inputBuffer) => {
          let dataView = fromBuffer(inputBuffer)
          let outputBuffer = dataView->buffer
          expect(outputBuffer)->toBe(inputBuffer)->affirm
        }
      )
    )
    pass
  })
})
describe("byteLength", () => {
  testAll("Result is equals the dataview length", list{
    (12, 4, 2),
    (12, 0, 0),
    (12, 0, 12)
  }, ((bufferLength, byteOffset, length)) => {
    let inputBuffer = ArrayBuffer.make(bufferLength)
    let dataView = fromBufferWithRange(inputBuffer, ~byteOffset, ~length)
    let actualLength = dataView->byteLength
    expect(actualLength)->toBe(length)
  })
})
describe("byteOffset", () => {
  testAll("Result is the byte offset used to create the data view", list{
    (12, 4, 2),
    (12, 0, 0),
    (12, 0, 12)
  }, ((bufferLength, byteOffset, length)) => {
    let inputBuffer = ArrayBuffer.make(bufferLength)
    let dataView = fromBufferWithRange(inputBuffer, ~byteOffset, ~length)
    let actualByteOffset = dataView->DataView.byteOffset
    expect(actualByteOffset)->toBe(byteOffset)
  })
})
describe("getInt8Raw and setInt8Truncated", () => {
  getFetchesSet(getInt8Raw, setInt8Truncated, rawInt8Arb(), 8)
})
describe("getUint8Raw and setUint8Truncated", () => {
  getFetchesSet(getUint8Raw, setUint8Truncated, rawUInt8Arb(), 8)
})
describe("getInt16Raw and setInt16Truncated", () => {
  getFetchesSet(getInt16Raw, setInt16Truncated, rawInt16Arb(), 16)
})
describe("getUint16Raw and setUint16Truncated", () => {
  getFetchesSet(getUint16Raw, setUint16Truncated, rawUInt16Arb(), 16)
})
describe("getInt32 and setInt32", () => {
  getFetchesSet(getInt32, setInt32, integer(), 32)
})
describe("getUint32Raw and setUint32Truncated", () => {
  getFetchesSet(getUint32Raw, setUint32Truncated, rawUInt32Arb(), 32)
})
describe("getInt64Raw and setBigInt64Truncated", () => {
  getFetchesSet(getBigInt64Raw, setBigInt64Truncated, rawInt64Arb(), 64)
})
describe("getUint64Raw and setBigUint64Truncated", () => {
  getFetchesSet(getBigUint64Raw, setBigUint64Truncated, rawUInt64Arb(), 64)
})
