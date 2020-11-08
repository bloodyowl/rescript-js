type t = Js.Re.t

module Result = {
  type t = array<string>
  @bs.get_index external fullMatch: (t, @bs.as(0) _) => string = ""
  @bs.send external matches: (t, @bs.as(1) _) => array<string> = "slice"
  @bs.get external index: t => int = "index"
  @bs.get external input: t => string = "input"
}

@bs.new external fromString: string => t = "RegExp"
@bs.new external fromStringWithFlags: (string, ~flags: string) => t = "RegExp"

@bs.send external test: (t, string) => bool = "test"
@bs.send external exec: (t, string) => Result.t = "exec"

@bs.get external lastIndex: t => int = "lastIndex"
@bs.get external ignoreCase: t => bool = "ignoreCase"
@bs.get external global: t => bool = "global"
@bs.get external multiline: t => bool = "multiline"
@bs.get external source: t => bool = "source"
@bs.get external sticky: t => bool = "sticky"
@bs.get external unicode: t => bool = "unicode"
