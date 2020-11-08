type t

@bs.new external make: string => t = "Intl.Locale"
@bs.new external makeWithOptions: (string, {..}) => t = "Intl.Locale"

@bs.get external baseName: t => string = "baseName"
@bs.get external calendar: t => option<string> = "calendar"
@bs.get external caseFirst: t => option<string> = "caseFirst"
@bs.get external collation: t => option<string> = "collation"
@bs.get external hourCycle: t => option<string> = "hourCycle"
@bs.get external language: t => string = "language"
@bs.get external numberingSystem: t => option<string> = "numberingSystem"
@bs.get external numeric: t => bool = "numeric"
@bs.get external region: t => option<string> = "region"
@bs.get external script: t => option<string> = "script"

@bs.send external maximize: t => t = "maximize"
@bs.send external minimize: t => t = "minimize"
