type t<'a>

type value<'a> = {
  done: bool,
  value: option<'a>,
}

@bs.send external next: t<'a> => Js__Promise.t<value<'a>, 'b> = "next"
