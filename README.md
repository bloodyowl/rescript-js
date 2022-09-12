# ReScriptJs

> Bindings to the JS standard library

## Goals

This is an alternative library to [the default `Js` module](https://rescript-lang.org/docs/manual/latest/api/js).

Main differences:

- Closer naming to the JS platform (e.g. `Object` vs `Obj`)
- Type-first pipe
- Consistent naming accross the bindings
- Some missing data-structures (e.g. `Map`, `WeakMap`, `Set`, `WeakSet`, `BigInt`, `Intl`)
- A DX that overall _looks_ more like JS (if you `open Js`, you should feel at home)
- Simple bindings to `window`, `document` and `globalThis` (they're basically typed as any)

Nearly all data structures maintain compatible types with the default `Js` module.

## Installation

Run the following in your console:

```console
$ yarn add rescript-js
```

Then add `rescript-js` to your `bsconfig.json`'s `bs-dependencies`:

```diff
 {
   "bs-dependencies": [
+    "rescript-js"
   ]
 }
```

If you want to exclusively use `rescript-js`:

```diff
 {
   "bsc-flags": [
+    "-open ReScriptJs",
   ]
 }
```

## Usage

```rescript
open ReScriptJs.Js

Console.log("Hello world!")

let timeout = setTimeout(() => {
  Console.log("Hello!")
}, 100)

clearTimeout(timeout)

let array = [1, 2, 3]

let sum = array
  ->Array.map(x => x * 2)
  ->Array.reduce((acc, item) => acc + item, 0)
```

Available modules are listed in [ReScriptJs.res](./src/ReScriptJs.res)

## Documentation for Specific Modules

[DataView](./docs/DataView.md)
