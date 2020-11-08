type t

@bs.new external make: unit => t = "Intl.Collator"
@bs.new external makeWithLocale: string => t = "Intl.Collator"
@bs.new external makeWithLocales: array<string> => t = "Intl.Collator"
@bs.new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.Collator"
@bs.new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.Collator"

@bs.val external supportedLocalesOf: array<string> => t = "Intl.Collator.supportedLocalesOf"
@bs.val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.Collator.supportedLocalesOf"

@bs.send external resolvedOptions: t => {..} = "resolvedOptions"

@bs.send external compare: (t, string, string) => int = "compare"
