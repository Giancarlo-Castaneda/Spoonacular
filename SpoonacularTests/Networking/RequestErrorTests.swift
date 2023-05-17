import XCTest

@testable import Spoonacular

final class RequestErrorTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RequestError

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

    func test_localizedDescription_whenIsDecode_shouldReturnValue() {
        sut = .decode

        XCTAssertEqual(sut.localizedDescription, "Decode error")
    }

    func test_localizedDescription_whenIsInvalidURL_shouldReturnValue() {
        sut = .invalidURL

        XCTAssertEqual(sut.localizedDescription, "Invalid URL")
    }

    func test_localizedDescription_whenIsNoResponse_shouldReturnValue() {
        sut = .noResponse

        XCTAssertEqual(sut.localizedDescription, "Unknown error")
    }

    func test_localizedDescription_whenIsUnauthorized_shouldReturnValue() {
        sut = .unauthorized

        XCTAssertEqual(sut.localizedDescription, "Session expired")
    }

    func test_localizedDescription_whenIsUnexpectedStatusCode_shouldReturnValue() {
        sut = .unexpectedStatusCode

        XCTAssertEqual(sut.localizedDescription, "Unexpected Status Code")
    }

    func test_localizedDescription_whenIsUnknown_shouldReturnValue() {
        sut = .unknown

        XCTAssertEqual(sut.localizedDescription, "Unknown error")
    }

    func test_localizedDescription_whenIsBadRequest_shouldReturnValue() {
        sut = .badRequest

        XCTAssertEqual(sut.localizedDescription, "Bad request")
    }
}
