@bs.obj external empty: unit => {..} = ""

@bs.val external is: ('a, 'b) => bool = "Object.is"

@bs.val external create: ({..}, {..}) => {..} = "Object.create"
@bs.val external createWithNull: ({..}, @bs.as(json`null`) _) => {..} = "Object.create"

@bs.val external assign: ({..}, {..}) => {..} = "Object.assign"
@bs.val external copy: (@bs.as(json`{}`) _, {..}) => {..} = "Object.assign"

@bs.get_index external get: ({..}, string) => option<'a> = ""
@bs.get_index external getSymbol: ({..}, Js__Symbol.t<'a>) => option<'a> = ""

@bs.set_index external set: ({..}, string, 'a) => unit = ""
@bs.set_index external setSymbol: ({..}, Js__Symbol.t<'a>, 'a) => unit = ""

@bs.val external keysToArray: {..} => array<string> = "Object.keys"

@bs.val external hasOwnProperty: ({..}, string) => bool = "Object.prototype.hasOwnProperty.call"

@bs.val external seal: 'a => 'a = "Object.seal"
@bs.val external preventExtensions: 'a => 'a = "Object.preventExtensions"
@bs.val external freeze: 'a => 'a = "Object.freeze"

@bs.val external isSealed: 'a => bool = "Object.isSealed"
@bs.val external isFrozen: 'a => bool = "Object.isFrozen"
@bs.val external isExtensible: 'a => bool = "Object.isExtensible"
