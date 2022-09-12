open Jest
open Expect
open ReScriptJs.Js.BigInt

testAll("lt", list{
  (fromInt(0), fromInt(1), true),
  (fromInt(0), fromInt(0), false),
  (fromInt(0), fromInt(-1), false)
}, ((lh, rh, expected)) => {
  expect(lt(lh, rh))->toBe(expected)
})

testAll("le", list{
  (fromInt(0), fromInt(1), true),
  (fromInt(0), fromInt(0), true),
  (fromInt(0), fromInt(-1), false)
}, ((lh, rh, expected)) => {
  expect(le(lh, rh))->toBe(expected)
})

testAll("gt", list{
  (fromInt(0), fromInt(1), false),
  (fromInt(0), fromInt(0), false),
  (fromInt(0), fromInt(-1), true)
}, ((lh, rh, expected)) => {
  expect(gt(lh, rh))->toBe(expected)
})

testAll("ge", list{
  (fromInt(0), fromInt(1), false),
  (fromInt(0), fromInt(0), true),
  (fromInt(0), fromInt(-1), true)
}, ((lh, rh, expected)) => {
  expect(ge(lh, rh))->toBe(expected)
})