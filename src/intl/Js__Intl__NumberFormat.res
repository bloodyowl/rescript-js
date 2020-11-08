type t

@bs.new external make: unit => t = "Intl.NumberFormat"
@bs.new external makeWithLocale: string => t = "Intl.NumberFormat"
@bs.new external makeWithLocales: array<string> => t = "Intl.NumberFormat"
@bs.new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.NumberFormat"
@bs.new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.NumberFormat"

@bs.val external supportedLocalesOf: array<string> => t = "Intl.NumberFormat.supportedLocalesOf"
@bs.val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.NumberFormat.supportedLocalesOf"

@bs.send external resolvedOptions: t => {..} = "resolvedOptions"

@bs.send external format: (t, float) => string = "format"
@bs.send
external formatToParts: (t, float) => array<{"type": string, "value": string}> = "formatToParts"

@bs.send external formatInt: (t, int) => string = "format"
@bs.send
external formatIntToParts: (t, int) => array<{"type": string, "value": string}> = "formatToParts"

@bs.send external formatBigInt: (t, Js__BigInt.t) => string = "format"
@bs.send
external formatBigIntToParts: (t, Js__BigInt.t) => array<{"type": string, "value": string}> =
  "formatToParts"
