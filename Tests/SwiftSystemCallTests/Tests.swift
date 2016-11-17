import XCTest
@testable import SwiftSystemCall

class SwiftSystemCallTests: XCTestCase {
    let system = System()

    static var allTests: [(String, (SwiftSystemCallTests) -> () throws -> Void)] {
        return [
            ("testPwd", testPwd),
        ]
    }

    func testPwd() {
        let result = system.call("pwd")
        XCTAssertFalse(result.lines.first?.isEmpty ?? true)
    }
}
