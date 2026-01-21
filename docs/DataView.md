# DataView

## Deviations from JavaScripts DataView

To reduce defects in client code, we've our DataView module has a slightly different interface from the one built into JavaScript. Specifically, we've made the following changes:

1. Only relevant numeric types are accepted as arguments for set\* functions.

    In particular, while EMCA 262 allows arguments to set\* to be undefined, null, boolean, numbers, strings, BigInts or primitive objects (see sections [25.3.1.2-SetViewValue](https://tc39.es/ecma262/multipage/structured-data.html#sec-setviewvalue) and [7.1.4-ToNumber](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-tonumber) of EMCA 262), we only accept one numeric type for each set\* function. A numeric type is one of int, float, and BigInt. For each function, we chose the type that has the smallest number of possible values of all types that can represent all valid input values. For example, while ints, floats and a BigInts can represent all int8s, int has the fewest possible values, so we chose it.

    By limiting ourselves to numeric types, force the client to specify how they want non-numeric values to be converted into numeric values and eliminate client defects that arise from incorrect assumptions about how non-numeric values are implicitly converted.

1. All set* functions that can modify their input data before writing it have their inputs constrained to avoid unexpected modifications.

    According to sections [25.1.2.11-NumericToRawBytes](https://tc39.es/ecma262/multipage/structured-data.html#sec-numerictorawbytes) and [23.2 TypedArray Objects](https://tc39.es/ecma262/multipage/indexed-collections.html#table-the-typedarray-constructors) of EMCA 262, integral values that are to big to fit in the specified set type are truncated. For setFloat32 values are rounded to the nearest valid float32 value even if the argument is outside the bounds of float32.

1. New set*Truncate and set*Round functions have been created so that clients can still get the old behavior if they want it.
1. All get\* functions with corresponding set\* functions that modify their input data before writing it have had their output constrained so that the input to set and the output of get are the same type.
1. New get*Raw functions have been created so that clients don't have to unwrap constrained values if they don't want to.

## Example Usage

```rescript
open Rescript.Js
open DataView
open ConstrainedType

let buffer = ArrayBuffer.make(64)
let dataView = fromBuffer(buffer)

// Setting and getting a value using ConstrainedType for extra safety
setUint8(dataview, 0, Value.makeExn(42, ~constraint_=module(UInt8)))
let value: Value.t<int, UInt8.identity> = getUint8(dataview, 0) // Set value to 42
let rawValue: int = value->Value.value // Sets rawValue = 42

// Setting and getting a value without ConstrainedType
setUint8Truncate(dataview, 0, 257)
let rawValue: int = getUint8(dataview, 1) // Set value to 0 (256 mod 256)
```
