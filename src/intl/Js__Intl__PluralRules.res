type t

@bs.new external make: unit => t = "Intl.PluralRules"
@bs.new external makeWithLocale: string => t = "Intl.PluralRules"
@bs.new external makeWithLocales: array<string> => t = "Intl.PluralRules"
@bs.new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.PluralRules"
@bs.new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.PluralRules"

@bs.val external supportedLocalesOf: array<string> => t = "Intl.PluralRules.supportedLocalesOf"
@bs.val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.PluralRules.supportedLocalesOf"

@bs.send external resolvedOptions: t => {..} = "resolvedOptions"

type rule = [#zero | #one | #two | #few | #many | #other]

@bs.send external select: (t, float) => rule = "format"
@bs.send external selectInt: (t, int) => rule = "format"
@bs.send external selectBigInt: (t, Js__BigInt.t) => rule = "format"
