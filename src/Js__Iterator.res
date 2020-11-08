type t<'a>
type next<'a>

@bs.get external done: next<'a> => bool = "done"
@bs.get external value: next<'a> => option<'a> = "value"

@bs.send external next: t<'a> => next<'a> = "next"
