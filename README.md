# ReScriptJs

> Bindings to the JS standard library

## Installation

Run the following in your console:

```console
$ yarn add rescript-js
```

Then add `rescript-js` to your `bsconfig.json`'s `bs-dependencies`:

```diff
 {
   "bs-dependencies": [
+    "rescript-js",
   ]
 }
```

## Usage

```reason
open ReScriptJs

Js.Console.log("Hello world!")
```

Available modules are listed in [RescriptJs.res](./src/RescriptJs.res)
