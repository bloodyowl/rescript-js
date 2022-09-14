module.exports = {
    collectCoverage: true,
    // ReScript compiles external functions by copying and pasting
    // their implementations into the generated js files of client 
    // code. By default, Jest only includes imported files not part 
    // of 3rd party libraries in its coverage report. Setting
    // collectCoverageFrom manually ensures that all files are visible.
    // This also helps catch files that have no tests at all.
    collectCoverageFrom: [
        "src/**/*.js"
    ],
    coverageThreshold: {
        // TODO: Set these values to 100 once we finish adding tests
        global: {
            branches: 0,
            functions: 0,
            lines: 0,
            statements: 0
        }
    },
    moduleFileExtensions: [
        "js",
        "mjs"
    ],
    setupFiles: ["./jest.setup.js"],
    testMatch: [
        "**/__tests__/**/*_test.mjs",
        "**/__tests__/**/*_test.bs.js",
    ],
    transform: {
        "^.+\.m?js$": "babel-jest"
    }
}