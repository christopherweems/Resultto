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
    
    func testStringResult() {
        @StringResult var testString: String {
            "1"
            "2"
            "3"
            
        }
        
        XCTAssertEqual(testString, "123")
        
    }
    
}
