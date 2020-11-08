@bs.val external log: 'a => unit = "console.log"
@bs.val external log2: ('a, 'b) => unit = "console.log"
@bs.val external log3: ('a, 'b, 'c) => unit = "console.log"
@bs.val external log4: ('a, 'b, 'c, 'd) => unit = "console.log"
@bs.val external log5: ('a, 'b, 'c, 'd, 'e) => unit = "console.log"

@bs.val external info: 'a => unit = "console.info"
@bs.val external info2: ('a, 'b) => unit = "console.info"
@bs.val external info3: ('a, 'b, 'c) => unit = "console.info"
@bs.val external info4: ('a, 'b, 'c, 'd) => unit = "console.info"
@bs.val external info5: ('a, 'b, 'c, 'd, 'e) => unit = "console.info"

@bs.val external warn: 'a => unit = "console.warn"
@bs.val external warn2: ('a, 'b) => unit = "console.warn"
@bs.val external warn3: ('a, 'b, 'c) => unit = "console.warn"
@bs.val external warn4: ('a, 'b, 'c, 'd) => unit = "console.warn"
@bs.val external warn5: ('a, 'b, 'c, 'd, 'e) => unit = "console.warn"

@bs.val external error: 'a => unit = "console.error"
@bs.val external error2: ('a, 'b) => unit = "console.error"
@bs.val external error3: ('a, 'b, 'c) => unit = "console.error"
@bs.val external error4: ('a, 'b, 'c, 'd) => unit = "console.error"
@bs.val external error5: ('a, 'b, 'c, 'd, 'e) => unit = "console.error"

@bs.val external trace: unit => unit = "console.trace"

@bs.val external timeStart: string => unit = "console.timeStart"
@bs.val external timeEnd: string => unit = "console.timeEnd"
