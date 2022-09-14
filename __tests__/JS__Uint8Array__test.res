open Jest
open ReScriptJs.Js

describe("make", () => {
  test("Empty array", () => {
    Uint8Array.make([])->ignore
    pass
  })
  test("Non-empty array", () => {
    Uint8Array.make([1, 2, 3])->ignore
    pass
  })
})
