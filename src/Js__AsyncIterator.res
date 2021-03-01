type t<'a>

type value<'a> = {
  done: bool,
  value: option<'a>,
}

@send external next: t<'a> => Promise.t<value<'a>> = "next"
