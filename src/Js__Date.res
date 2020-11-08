type t = Js.Date.t

module Time = {
  type t = float
}

@bs.send external valueOf: t => Time.t = "valueOf"

@bs.new external make: unit => t = "Date"
@bs.new external fromString: string => t = "Date"
@bs.new external fromTime: Time.t => t = "Date"

@bs.new external makeWithYM: (~year: int, ~month: int) => t = "Date"
@bs.new external makeWithYMD: (~year: int, ~month: int, ~date: int) => t = "Date"
@bs.new external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => t = "Date"
@bs.new
external makeWithYMDHM: (~year: int, ~month: int, ~date: int, ~hours: int, ~minutes: int) => t =
  "Date"
@bs.new
external makeWithYMDHMS: (
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
) => t = "Date"
@bs.new
external makeWithYMDHMSM: (
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => t = "Date"

module UTC = {
  @bs.val external makeWithYM: (~year: int, ~month: int) => Time.t = "Date.UTC"
  @bs.val external makeWithYMD: (~year: int, ~month: int, ~date: int) => Time.t = "Date.UTC"
  @bs.val
  external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => Time.t = "Date.UTC"
  @bs.val
  external makeWithYMDHM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
  ) => Time.t = "Date.UTC"
  @bs.val
  external makeWithYMDHMS: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
  ) => Time.t = "Date.UTC"
  @bs.val
  external makeWithYMDHMSM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
    ~milliseconds: int,
  ) => Time.t = "Date.UTC"
}

@bs.val external now: unit => Time.t = "Date.now"

@bs.send external getTime: t => Time.t = "getTime"
@bs.send external getTimezoneOffset: t => int = "getTimezoneOffset"

// Locale
@bs.send external getFullYear: t => int = "getFullYear"
@bs.send external getMonth: t => int = "getMonth"
@bs.send external getDate: t => int = "getDate"
@bs.send external getHours: t => int = "getHours"
@bs.send external getMinutes: t => int = "getMinutes"
@bs.send external getSeconds: t => int = "getSeconds"
@bs.send external getMilliseconds: t => int = "getMilliseconds"
@bs.send external getDay: t => int = "getDay"

@bs.send external setFullYear: (t, int) => unit = "setFullYear"
@bs.send external setFullYearM: (t, ~year: int, ~month: int) => unit = "setFullYear"
@bs.send external setFullYearMD: (t, ~year: int, ~month: int, ~date: int) => unit = "setFullYear"
@bs.send external setMonth: (t, int) => unit = "setMonth"
@bs.send external setDate: (t, int) => unit = "setDate"
@bs.send external setHours: (t, int) => unit = "setHours"
@bs.send external setHoursM: (t, ~hours: int, ~minutes: int) => unit = "setHours"
@bs.send external setHoursMS: (t, ~hours: int, ~minutes: int, ~seconds: int) => unit = "setHours"
@bs.send
external setHoursMSMs: (t, ~hours: int, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit =
  "setHours"
@bs.send external setMinutes: (t, int) => unit = "setMinutes"
@bs.send external setMinutesS: (t, ~minutes: int, ~seconds: int) => unit = "setMinutes"
@bs.send
external setMinutesSMs: (t, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit = "setMinutes"
@bs.send external setSeconds: (t, int) => unit = "setSeconds"
@bs.send external setSecondsMs: (t, ~seconds: int, ~milliseconds: int) => unit = "setSeconds"
@bs.send external setMilliseconds: (t, int) => unit = "setMilliseconds"
@bs.send external setDay: (t, int) => unit = "setDay"

// UTC
@bs.send external getUTCFullYear: t => int = "getUTCFullYear"
@bs.send external getUTCMonth: t => int = "getUTCMonth"
@bs.send external getUTCDate: t => int = "getUTCDate"
@bs.send external getUTCHours: t => int = "getUTCHours"
@bs.send external getUTCMinutes: t => int = "getUTCMinutes"
@bs.send external getUTCSeconds: t => int = "getUTCSeconds"
@bs.send external getUTCMilliseconds: t => int = "getUTCMilliseconds"
@bs.send external getUTCDay: t => int = "getUTCDay"

@bs.send external setUTCFullYear: (t, int) => unit = "setUTCFullYear"
@bs.send external setUTCFullYearM: (t, ~year: int, ~month: int) => unit = "setUTCFullYear"
@bs.send
external setUTCFullYearMD: (t, ~year: int, ~month: int, ~date: int) => unit = "setUTCFullYear"
@bs.send external setUTCMonth: (t, int) => unit = "setUTCMonth"
@bs.send external setUTCDate: (t, int) => unit = "setUTCDate"
@bs.send external setUTCHours: (t, int) => unit = "setUTCHours"
@bs.send external setUTCHoursM: (t, ~hours: int, ~minutes: int) => unit = "setUTCHours"
@bs.send
external setUTCHoursMS: (t, ~hours: int, ~minutes: int, ~seconds: int) => unit = "setUTCHours"
@bs.send
external setUTCHoursMSMs: (
  t,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit = "setUTCHours"
@bs.send external setUTCMinutes: (t, int) => unit = "setUTCMinutes"
@bs.send external setUTCMinutesS: (t, ~minutes: int, ~seconds: int) => unit = "setUTCMinutes"
@bs.send
external setUTCMinutesSMs: (t, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit =
  "setUTCMinutes"
@bs.send external setUTCSeconds: (t, int) => unit = "setUTCSeconds"
@bs.send external setUTCSecondsMs: (t, ~seconds: int, ~milliseconds: int) => unit = "setUTCSeconds"
@bs.send external setUTCMilliseconds: (t, int) => unit = "setUTCMilliseconds"
@bs.send external setUTCDay: (t, int) => unit = "setUTCDay"

@bs.send external toDateString: t => string = "toDateString"
@bs.send external toString: t => string = "toString"
@bs.send external toTimeString: t => string = "toTimeString"

@bs.send external toLocaleDateString: t => string = "toLocaleDateString"
@bs.send external toLocaleString: t => string = "toLocaleString"
@bs.send external toLocaleTimeString: t => string = "toLocaleTimeString"

@bs.send external toISOString: t => string = "toISOString"
@bs.send external toUTCString: t => string = "toUTCString"
@bs.return(nullable) @bs.send external toJSON: t => option<string> = "toJSON"
