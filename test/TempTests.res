open ReScriptJs.Js

Console.info("")
Console.info("Array")
Console.info("---")
let array = [1, 2, 3, 4]
Console.info(array->Array.map(x => x * 2)->Array.reduce((a, b) => a + b, 0))
Console.info(typeof(array))

Console.info("")
Console.info("Date")
Console.info("---")
let date = Date.fromTime(Date.UTC.makeWithYM(~year=2020, ~month=11))
Console.log(date->Date.toUTCString)

Console.info("")
Console.info("Dict")
Console.info("---")
let dict = Dict.empty()
dict->Dict.set("foo", "bar")
let dict2 = dict->Dict.copy
dict2->Dict.delete("foo")
Console.log2(dict, dict2)

Console.info("")
Console.info("Error")
Console.info("---")
let f = () => {
  let error = Error.make("hello")
  let typeError = Error.TypeError.make("error")
  let g = () => Error.raise(error)
  let h = () => Error.raise(typeError)
  (g, h)
}

Console.info("")
Console.info("Float/Int")
Console.info("---")
Console.log(10.2->Float.toFixedWithPrecision(~digits=2))
Console.log(10->Int.toFixedWithPrecision(~digits=2))

Console.info("")
Console.info("Intl")
Console.info("---")
let currencyFormatter = Intl.NumberFormat.makeWithLocaleAndOptions(
  "fr-FR",
  {"currency": "EUR", "style": "currency"},
)

Console.log(Intl.NumberFormat.supportedLocalesOf(["fr-FR", "en-US"]))
Console.log(currencyFormatter->Intl.NumberFormat.format(123.23))

Console.info("")
Console.info("JSON")
Console.info("---")
let json = JSON.parseExn(`{"foo": "bar"}`)
Console.log(
  switch JSON.Decode.classify(json) {
  | Ok(Object(json)) =>
    switch JSON.Decode.classify(json->Dict.get("foo")) {
    | Ok(String(value)) => Some(value)
    | _ => None
    }
  | _ => None
  },
)

Console.info("")
Console.info("Map")
Console.info("---")
let map = Map.make()
map->Map.set(1, 1)
map->Map.set(2, 2)
map->Map.delete(1)
Js.log(map)

Console.info("")
Console.info("Math")
Console.info("---")
Js.log(Math.ceil(Math.Constants.pi /. 2.0))

Console.info("")
Console.info("Object")
Console.info("---")
let myObject = {
  "foo": "bar",
}

let copy = Object.copy(myObject)
let withNewProp = Object.assign(copy, {"bar": "baz"})

Console.info("")
Console.info("Promise")
Console.info("---")
let promise: Promise.t<int, unit> = Promise.make((resolve, _reject) => {
  let _ = setTimeout(() => {
    resolve(1)
  }, 100)
})

promise
->Promise.then(x => x + 1)
->Promise.then(x => x + 2)
->Promise.then(Console.log)
->Promise.finally(() => {
  Console.log("Promise finally")
})

Console.info("")
Console.info("RegExp")
Console.info("---")
let regex = RegExp.fromString("hello(\\w+)")
let string = "helloworld"
Console.log(regex->RegExp.test(string))
let result = regex->RegExp.exec(string)
Js.log(result->RegExp.Result.input)
Js.log(result->RegExp.Result.index)
Js.log(result->RegExp.Result.matches)

Console.info("")
Console.info("Set")
Console.info("---")
let set = Set.make()
set->Set.add(1)->Set.add(2)->Set.delete(2)
Js.log(set)

Console.info("")
Console.info("String")
Console.info("---")
let regexp = RegExp.fromString("(hello )(world)")
Console.log(
  "   Hello world  "
  ->String.toLowerCase
  ->String.trim
  ->String.unsafeReplaceRegExpBy2(
    regexp,
    (~match as _, ~group1, ~group2, ~offset as _, ~input as _) => {
      group1 ++ group2->String.toUpperCase
    },
  ),
)

Console.info("")
Console.info("Symbol")
Console.info("---")
let x = Symbol.getFor("Foo")
Console.log(x)
let array: array<string> = Array.fromIterator(String.getSymbolUnsafe("foo", Symbol.iterator)(.))
Console.log(array)

Console.info("")
Console.info("Global namespace")
Console.info("---")

Console.log(typeof(1))

let timeout = setTimeout(() => {
  Console.log("Hello!")
}, 100)

clearTimeout(timeout)

if globalThis["hello"] !== undefined {
  Js.log(globalThis["hello"]["bar"])
  Js.log("hello")
}
