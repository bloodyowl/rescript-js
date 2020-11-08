open ReScriptJs.Js

// Console.log(
//   Array.fromIterator(
//     Map.make()->Map.set("foo", 1)->Map.set("bar", 2)->Map.set("baz", 3)->Map.entries,
//   ),
// )

// let a = Dict.fromArray([("foo", "bar")])

// let b = a->Dict.copy

// let x = Float.parseInt("&é")

// let y = {
//   open BigInt
//   add(fromString("333"), fromString("222"))
// }

let myObject = {
  "foo": "bar",
}

let currencyFormatter = Intl.NumberFormat.makeWithLocaleAndOptions(
    "fr-FR",
    {"currency": "EUR", "style": "currency"},
  )

Console.log(Intl.NumberFormat.supportedLocalesOf(["fr-FR", "en-US"]))
Console.log(
  currencyFormatter->Intl.NumberFormat.format(123.23),
)
