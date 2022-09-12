open Jest
open FastCheck
open Expect
open Property.SyncUnit
open Arbitrary
open ReScriptJs.Js
open DataView
open ConstrainedType

let bufferArb = (~minSize, ~maxSize) => {
  integerRange(minSize, maxSize)->Derive.map(size => ArrayBuffer.make(size))
}

let dataviewArb = (~minSize, ~maxSize) => {
  bufferArb(~minSize, ~maxSize)->Derive.map(fromBuffer)  
}

let rawInt8Arb = () => integerRange(-128, 127)
let int8Arb = () => rawInt8Arb()->Derive.map(Value.makeExn(~constraint_=module(Int8)))
let rawUInt8Arb = () => integerRange(0, 255)
let uInt8Arb = () => rawUInt8Arb()->Derive.map(Value.makeExn(~constraint_=module(UInt8)))
let rawInt16Arb = () => integerRange(-32768, 32767)
let int16Arb = () => rawInt16Arb()->Derive.map(Value.makeExn(~constraint_=module(Int16)))
let rawUInt16Arb = () => integerRange(0, 65535)
let uInt16Arb = () => rawUInt16Arb()->Derive.map(Value.makeExn(~constraint_=module(UInt16)))
let rawUInt32Arb = () => floatRange(0.0, 4294967295.0)->Derive.map(Js.Math.round)
let uInt32Arb = () => rawUInt32Arb()->Derive.map(Value.makeExn(~constraint_=module(UInt32)))
let rawUInt64Arb = () => Combinators.tuple2(rawUInt32Arb(), rawUInt32Arb())->Derive.map(((mostSignificant, leastSignificant)) => {
  open BigInt
  fromFloat(mostSignificant)->BigInt.lsl(fromInt(32))->add(fromFloat(leastSignificant))
})
let uInt64Arb = () => rawUInt64Arb()->Derive.map(Value.makeExn(~constraint_=module(UInt64)))
let rawInt64Arb = () => rawUInt64Arb()->Derive.map(bits => {
  open BigInt
  let absMinInt64 = fromInt(1)->BigInt.lsl(fromInt(63)) // 2**63
  bits->sub(absMinInt64)
})
let int64Arb = () => rawInt64Arb()->Derive.map(Value.makeExn(~constraint_=module(Int64)))
let float32Arb = () => float_()->Derive.map(Value.makeExn(~constraint_=module(Float32)))

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

describe("Constraints", () => {
  describe("UInt8", () => {
    testAll("isSatisfied", list{
      (0, true),
      (1, true),
      (255, true),
      (42, true),
      (-1, false),
      (256, false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(UInt8), value))->toBe(expected)
    })
  })
  describe("Int8", () => {
    testAll("isSatisfied", list{
      (0, true),
      (1, true),
      (42, true),
      (127, true),
      (128, false),
      (-128, true),
      (-129, false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(Int8), value))->toBe(expected)
    })
  })
  describe("UInt16", () => {
    testAll("isSatisfied", list{
      (0, true),
      (1, true),
      (65535, true),
      (42, true),
      (-1, false),
      (65536, false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(UInt16), value))->toBe(expected)
    })
  })
  describe("Int16", () => {
    testAll("isSatisfied", list{
      (0, true),
      (1, true),
      (42, true),
      (32767, true),
      (32768, false),
      (-32768, true),
      (-32769, false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(Int16), value))->toBe(expected)
    })
  })
  describe("UInt32", () => {
    testAll("isSatisfied", list{
      (0.0, true),
      (1.0, true),
      (4294967295.0, true),
      (42.0, true),
      (-1.0, false),
      (4294967296.0, false),
      (4294967295.5, false),
      (4294967294.5, false),
      (0.5, false),
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(UInt32), value))->toBe(expected)
    })
  })
  describe("UInt64", () => {
    open Js__BigInt
    testAll("isSatisfied", list{
      (fromString("0"), true),
      (fromString("1"), true),
      (fromString("18446744073709551615"), true),
      (fromString("42"), true),
      (fromString("-1"), false),
      (fromString("18446744073709551616"), false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(UInt64), value))->toBe(expected)
    })
  })
  describe("Int64", () => {
    open Js__BigInt
    testAll("isSatisfied", list{
      (fromString("0"), true),
      (fromString("1"), true),
      (fromString("9223372036854775807"), true),
      (fromString("42"), true),
      (fromString("-1"), true),
      (fromString("9223372036854775808"), false),
      (fromString("-9223372036854775808"), true),
      (fromString("-9223372036854775809"), false)
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(Int64), value))->toBe(expected)
    })
  })
  describe("Float32", () => {
    testAll("isSatisfied", list{
      (0.0, true),
      (1.0, true),
      (0.1, false), // Infininate repeating binary must have different float32 and float64 representations
      (-1.0, true),
      (-0.1, false), // Infininate repeating binary must have different float32 and float64 representations
      (0.5, true),
      (-0.5, true),
      (Js.Float._NaN, true),
      (Pervasives.infinity, true),
      (Pervasives.neg_infinity, true),
      (340282346638528859811704183484516925440.0, true), // Maximum finite float32
      (440282346638528859811704183484516925440.0, false),
      (-340282346638528859811704183484516925440.0, true), // Minimum finite float32
      (-440282346638528859811704183484516925440.0, false),
    }, ((value, expected)) => {
      expect(Constraint.isSatisfied(module(Float32), value))->toBe(expected)
    })
  })
})

describe("Accessors", () => {
  describe("getInt8Raw and setInt8Truncated", () => {
    getFetchesSet(getInt8Raw, setInt8Truncated, rawInt8Arb(), 8)
  })
  describe("getInt8 and setInt8", () => {
    getFetchesSet(getInt8, setInt8, int8Arb(), 8)
  })

  describe("getUint8Raw and setUint8Truncated", () => {
    getFetchesSet(getUint8Raw, setUint8Truncated, rawUInt8Arb(), 8)
  })
  describe("getUint8 and setUint8", () => {
    getFetchesSet(getUint8, setUint8, uInt8Arb(), 8)
  })

  describe("getInt16Raw and setInt16Truncated", () => {
    getFetchesSet(getInt16Raw, setInt16Truncated, rawInt16Arb(), 16)
  })
  describe("getInt16 and setInt16", () => {
    getFetchesSet(getInt16, setInt16, int16Arb(), 16)
  })

  describe("getUint16Raw and setUint16Truncated", () => {
    getFetchesSet(getUint16Raw, setUint16Truncated, rawUInt16Arb(), 16)
  })
  describe("getUint16 and setUint16", () => {
    getFetchesSet(getUint16, setUint16, uInt16Arb(), 16)
  })

  describe("getInt32 and setInt32", () => {
    getFetchesSet(getInt32, setInt32, integer(), 32)
  })

  describe("getUint32Raw and setUint32Truncated", () => {
    getFetchesSet(getUint32Raw, setUint32Truncated, rawUInt32Arb(), 32)
  })
  describe("getUint32 and setUint32", () => {
    getFetchesSet(getUint32, setUint32, uInt32Arb(), 32)
  })

  describe("getInt64Raw and setBigInt64Truncated", () => {
    getFetchesSet(getBigInt64Raw, setBigInt64Truncated, rawInt64Arb(), 64)
  })
  describe("getInt64 and setBigInt64", () => {
    getFetchesSet(getBigInt64, setBigInt64, int64Arb(), 64)
  })

  describe("getUint64Raw and setBigUint64Truncated", () => {
    getFetchesSet(getBigUint64Raw, setBigUint64Truncated, rawUInt64Arb(), 64)
  })
  describe("getUint64 and setBigUint64", () => {
    getFetchesSet(getBigUint64, setBigUint64, uInt64Arb(), 64)
  })

  describe("getFloat32Raw and setFloat32Rounded", () => {
    getFetchesSet(getFloat32Raw, setFloat32Rounded, float_(), 32)
  })
  describe("getFloat32 and setFloat32", () => {
    getFetchesSet(getFloat32, setFloat32, float32Arb(), 32)
  })

  describe("getFloat64 and setFloat64", () => {
    getFetchesSet(getFloat64, setFloat64, double(), 64)
  })
})
