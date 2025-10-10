import XCTest
import MapboxMapGpt


final class MapboxMapGptTests: XCTestCase {
    func testVersion() {
        XCTAssertTrue(ValueConverter.toJson(forValue: 0) == "0")
    }

    static var allTests = [
        ("testVersion", testVersion),
    ]
}
