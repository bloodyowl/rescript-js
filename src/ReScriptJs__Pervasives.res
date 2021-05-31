external raise: exn => 'a = "%raise"

external __LOC__: string = "%loc_LOC"
external __FILE__: string = "%loc_FILE"
external __LINE__: int = "%loc_LINE"
external __MODULE__: string = "%loc_MODULE"
external __POS__: (string, int, int, int) = "%loc_POS"

external __LOC_OF__: 'a => (string, 'a) = "%loc_LOC"
external __LINE_OF__: 'a => (int, 'a) = "%loc_LINE"
external __POS_OF__: 'a => (string, int, int, int, 'a) = "%loc_POS"

external \"=": ('a, 'a) => bool = "%equal"
external \"<>": ('a, 'a) => bool = "%notequal"
external \"<": ('a, 'a) => bool = "%lessthan"
external \">": ('a, 'a) => bool = "%greaterthan"
external \"<=": ('a, 'a) => bool = "%lessequal"
external \">=": ('a, 'a) => bool = "%greaterequal"
external min: ('a, 'a) => 'a = "%bs_min"
external max: ('a, 'a) => 'a = "%bs_max"
external \"==": ('a, 'a) => bool = "%eq"
external \"!=": ('a, 'a) => bool = "%noteq"

external compare: ('a, 'a) => int = "%compare"

external not: bool => bool = "%boolnot"
external \"&&": (bool, bool) => bool = "%sequand"
external \"||": (bool, bool) => bool = "%sequor"

external \"~-": int => int = "%negint"
external \"~+": int => int = "%identity"
external succ: int => int = "%succint"
external pred: int => int = "%predint"
external \"+": (int, int) => int = "%addint"
external \"-": (int, int) => int = "%subint"
external \"*": (int, int) => int = "%mulint"
external \"/": (int, int) => int = "%divint"
external mod: (int, int) => int = "%modint"

external land: (int, int) => int = "%andint"
external lor: (int, int) => int = "%orint"
external lxor: (int, int) => int = "%xorint"

external lsl: (int, int) => int = "%lslint"
external lsr: (int, int) => int = "%lsrint"
external asr: (int, int) => int = "%asrint"

external \"~-.": float => float = "%negfloat"
external \"~+.": float => float = "%identity"
external \"+.": (float, float) => float = "%addfloat"
external \"-.": (float, float) => float = "%subfloat"
external \"*.": (float, float) => float = "%mulfloat"
external \"/.": (float, float) => float = "%divfloat"

external \"**": (float, float) => float = "Math.pow"

external \"^": (string, string) => string = "#string_append"

external ignore: 'a => unit = "%ignore"

type ref<'a> = Pervasives.ref<'a> = {mutable contents: 'a}
external ref: 'a => ref<'a> = "%makemutable"
external \"!": ref<'a> => 'a = "%bs_ref_field0"
external \":=": (ref<'a>, 'a) => unit = "%bs_ref_setfield0"
external incr: ref<int> => unit = "%incr"
external decr: ref<int> => unit = "%decr"

type result<'a, 'b> = Belt.Result.t<'a, 'b> =
  | Ok('a)
  | Error('b)

external identity: 'a => 'a = "%identity"
