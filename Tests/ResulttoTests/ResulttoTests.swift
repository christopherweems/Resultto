import XCTest
@testable import Resultto

final class ResulttoTests: XCTestCase {
    func testAllNil() {
        let a: String? = nil
        let b = 42
        
        @AllNil var notNil: Bool {
            a
            b
            
        }
        
        XCTAssertFalse(notNil)
        
    }
    
    func testAllTrue() {
        let falseStatement = false
        
        @AllTrue var trueStatement: Bool {
            true
            true
            
            if falseStatement {
                false
                
            } else {
                true
            }
        }
        
        @AllTrue var falseStatement2: Bool {
            true
            true
            
            if falseStatement {
                true
                
            } else {
                false
            }
        }
        
        XCTAssertTrue(trueStatement)
        XCTAssertFalse(falseStatement2)
    }
    
    func testCount() {
        @Count var five: Int {
            true
            false
            true
            true
            true
            false
            false
            true
            
        }
        
        XCTAssertEqual(five, 5)
        
    }
    
    func testSetResult() {
        @SetResult var testSet: Set<Int> {
            1
            2
            2
            
        }
        
        XCTAssertEqual(testSet, [1,2])
        
    }
   
    #if canImport(Foundation)
    func testURLResult() {
        @URLResult var testURL: URL {
            "https://wikipedia.org"
        }
        
        @URLResult var test2URL: URL {
            URL(string: "https://wikipedia.org")!
        }
        
        XCTAssertEqual(testURL.absoluteString, "https://wikipedia.org")
        XCTAssertEqual(testURL, test2URL)
        
    }
    
    #endif
    
}
