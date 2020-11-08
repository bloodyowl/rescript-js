type t

@bs.new external make: unit => t = "Intl.RelativeTimeFormat"
@bs.new external makeWithLocale: string => t = "Intl.RelativeTimeFormat"
@bs.new external makeWithLocales: array<string> => t = "Intl.RelativeTimeFormat"
@bs.new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.RelativeTimeFormat"
@bs.new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.RelativeTimeFormat"

@bs.val
external supportedLocalesOf: array<string> => t = "Intl.RelativeTimeFormat.supportedLocalesOf"
@bs.val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.RelativeTimeFormat.supportedLocalesOf"

@bs.send external resolvedOptions: t => {..} = "resolvedOptions"

type timeUnit = [#year | #quarter | #month | #week | #day | #hour | #minute | #second]

@bs.send external format: (t, int, timeUnit) => string = "format"
@bs.send
external formatToParts: (
  t,
  int,
  timeUnit,
) => array<{
  "type": string,
  "value": string,
  "unit": option<string>,
}> = "formatToParts"
