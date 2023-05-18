import XCTest

@testable import Spoonacular

final class HTTPMethodTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = HTTPMethod

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

    func test_rawValue_whenIsGet_shouldReturnValue() {
        sut = .get

        XCTAssertEqual(sut.rawValue, "GET")
    }

    func test_rawValue_whenIsDelete_shouldReturnValue() {
        sut = .delete

        XCTAssertEqual(sut.rawValue, "DELETE")
    }

    func test_rawValue_whenIsHead_shouldReturnValue() {
        sut = .head

        XCTAssertEqual(sut.rawValue, "HEAD")
    }

    func test_rawValue_whenIsPatch_shouldReturnValue() {
        sut = .patch

        XCTAssertEqual(sut.rawValue, "PATCH")
    }

    func test_rawValue_whenIsPost_shouldReturnValue() {
        sut = .post

        XCTAssertEqual(sut.rawValue, "POST")
    }

    func test_rawValue_whenIsPut_shouldReturnValue() {
        sut = .put

        XCTAssertEqual(sut.rawValue, "PUT")
    }
}
