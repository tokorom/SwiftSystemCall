import XCTest
@testable import SwiftSystemCall

class SwiftSystemCallTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftSystemCall().text, "Hello, World!")
    }


    static var allTests : [(String, (SwiftSystemCallTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
