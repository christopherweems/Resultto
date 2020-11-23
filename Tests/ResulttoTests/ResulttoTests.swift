import XCTest
@testable import Resultto

final class ResulttoTests: XCTestCase {
    static var allTests = [
        ("testAllNil", testAllNil),
        
    ]
    
}

extension ResulttoTests {
    func testAllNil() {
        let a: String? = nil
        let b = 42
        
        @AllNil var notNil: Bool {
            a
            b
            
        }
        
        XCTAssertFalse(notNil)
        
    }
    
}
