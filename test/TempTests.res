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

type rec a = {
  a: a
}
let rec a = {
  a: a
}

Console.log(Serializer.deserializeUnsafe(Serializer.serializeExn([Some(1), None, None, Some(2)])))
