open Jest
open Expect
open ReScriptJs.Js
open TypedArray

describe("setTypedArray", () => {
  testAll(
    "Same type",
    list{
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([4, 5, 6]), Uint8Array.make([4, 5, 6])),
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([4, 5]), Uint8Array.make([4, 5, 3])),
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([]), Uint8Array.make([1, 2, 3])),
    },
    ((arg1, arg2, expected)) => {
      setTypedArray(arg1, arg2)
      expect(arg1)->toEqual(expected)
    },
  )

  testAll(
    "Different type",
    list{
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([4, 5, 6]), Uint8Array.make([4, 5, 6])),
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([4, 5]), Uint8Array.make([4, 5, 3])),
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([]), Uint8Array.make([1, 2, 3])),
    },
    ((arg1, arg2, expected)) => {
      setTypedArray(arg1, arg2)
      expect(arg1)->toEqual(expected)
    },
  )
})
describe("setTypedArray", () => {
  testAll(
    "Same type",
    list{
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([4, 5, 6]), 0, Uint8Array.make([4, 5, 6])),
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([4, 5]), 0, Uint8Array.make([4, 5, 3])),
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([]), 0, Uint8Array.make([1, 2, 3])),
      (Uint8Array.make([1, 2, 3]), Uint8Array.make([4, 5]), 1, Uint8Array.make([1, 4, 5])),
    },
    ((arg1, arg2, from, expected)) => {
      setTypedArrayFrom(arg1, arg2, ~from)
      expect(arg1)->toEqual(expected)
    },
  )
  testAll(
    "Different type",
    list{
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([4, 5, 6]), 0, Uint8Array.make([4, 5, 6])),
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([4, 5]), 0, Uint8Array.make([4, 5, 3])),
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([]), 0, Uint8Array.make([1, 2, 3])),
      (Uint8Array.make([1, 2, 3]), Uint16Array.make([4, 5]), 1, Uint8Array.make([1, 4, 5])),
    },
    ((arg1, arg2, from, expected)) => {
      setTypedArrayFrom(arg1, arg2, ~from)
      expect(arg1)->toEqual(expected)
    },
  )
})
