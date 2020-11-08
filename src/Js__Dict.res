type t<'a> = Js.Dict.t<'a>

@bs.get_index external get: (t<'a>, string) => option<'a> = ""
@bs.set_index external set: (t<'a>, string, 'a) => unit = ""
@bs.val external delete: 'a => unit = "delete"

let delete = (dict, string) => {
  delete(get(dict, string))
}

@bs.obj external empty: unit => t<'a> = ""

@bs.val external fromArray: array<(string, 'a)> => t<'a> = "Object.fromEntries"
@bs.val external fromIterator: Js__Iterator.t<(string, 'a)> => t<'a> = "Object.fromEntries"

@bs.val external toArray: t<'a> => array<'a> = "Object.entries"

@bs.val external keysToArray: t<'a> => array<string> = "Object.keys"

@bs.val external valuesToArray: t<'a> => array<'a> = "Object.values"

@bs.val external assign: (t<'a>, t<'a>) => t<'a> = "Object.assign"

@bs.val external copy: (@bs.as(json`{}`) _, t<'a>) => t<'a> = "Object.assign"
