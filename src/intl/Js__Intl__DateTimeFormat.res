type t

@bs.new external make: unit => t = "Intl.DateTimeFormat"
@bs.new external makeWithLocale: string => t = "Intl.DateTimeFormat"
@bs.new external makeWithLocales: array<string> => t = "Intl.DateTimeFormat"
@bs.new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.DateTimeFormat"
@bs.new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.DateTimeFormat"

@bs.val external supportedLocalesOf: array<string> => t = "Intl.DateTimeFormat.supportedLocalesOf"
@bs.val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.DateTimeFormat.supportedLocalesOf"

@bs.send external resolvedOptions: t => {..} = "resolvedOptions"

@bs.send external format: (t, Js__Date.t) => string = "format"
@bs.send
external formatToParts: (t, Js__Date.t) => array<{"type": string, "value": string}> =
  "formatToParts"

@bs.send
external formatRange: (t, ~startDate: Js__Date.t, ~endDate: Js__Date.t) => string = "formatRange"

@bs.send
external formatRangeToParts: (
  t,
  ~startDate: Js__Date.t,
  ~endDate: Js__Date.t,
) => array<{
  "type": string,
  "value": string,
  "source": string,
}> = "formatRange"
