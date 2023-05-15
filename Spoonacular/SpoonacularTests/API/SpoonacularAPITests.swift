import XCTest

@testable import Spoonacular

final class SpoonacularAPITests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = SpoonacularAPI

    // MARK: Private Properties

    private var sut: SUT!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
    }

    // MARK: Tests

    func test_init_givenValues_shouldSetValues() {
        sut = SUT(path: "foo.path", method: .delete, body: ["foo.body.key.1" : "foo.body.value.1"])

        XCTAssertEqual(sut.path, "foo.path")
        XCTAssertEqual(sut.method.rawValue, "DELETE")
        XCTAssertEqual(sut.body?["foo.body.key.1"] as? String, "foo.body.value.1")
    } 
}
