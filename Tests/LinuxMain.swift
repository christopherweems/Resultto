import XCTest

import ResulttoTests

var tests = [XCTestCaseEntry]()
tests += ResulttoTests.allTests()
XCTMain(tests)
