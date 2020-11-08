type t<'a>

type value<'a> = {
  done: bool,
  value: option<'a>,
}

@bs.send external next: t<'a> => value<'a> = "next"
