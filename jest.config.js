module.exports = {
    collectCoverage: true,
    coverageThreshold: {
        global: {
            branches: 100,
            functions: 100,
            lines: 100,
            statements: 100
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