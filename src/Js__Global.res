type timeoutId = Js.Global.timeoutId

@bs.val external setTimeout: (unit => unit, int) => timeoutId = "setTimeout"
@bs.val external setTimeoutFloat: (unit => unit, float) => timeoutId = "setTimeout"
@bs.val external clearTimeout: timeoutId => unit = "clearTimeout"

type intervalId = Js.Global.intervalId

@bs.val external setInterval: (unit => unit, int) => intervalId = "setInterval"
@bs.val external setIntervalFloat: (unit => unit, float) => intervalId = "setInterval"
@bs.val external clearInterval: intervalId => unit = "clearInterval"

@bs.val external encodeURI: string => string = "encodeURI"
@bs.val external decodeURI: string => string = "decodeURI"

@bs.val external encodeURIComponent: string => string = "encodeURIComponent"
@bs.val external decodeURIComponent: string => string = "decodeURIComponent"
