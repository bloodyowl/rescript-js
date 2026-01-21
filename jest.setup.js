const fc = require("fast-check");
// Since our runs are very fast, the tradeoff between defect rates and 
// test time favors doing many runs
fc.configureGlobal({ numRuns: 10000 });

// Workaround to missing fail function. Source: https://github.com/facebook/jest/issues/11698#issuecomment-1135857402
function fail(reason = "fail was called in a test.") {
  throw new Error(reason);
}
global.fail = fail;