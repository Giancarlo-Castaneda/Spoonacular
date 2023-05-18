import XCTest

@testable import Spoonacular

final class ConcreteRecipeViewModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteRecipeViewModel

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

    func test_initGivenValues_shouldSetValues() throws {
        let url = try XCTUnwrap(URL(string: "foo.com"))

        sut = SUT(id: 1111, title: "foo.title", image: url)

        XCTAssertEqual(sut.id, 1111)
        XCTAssertEqual(sut.title, "foo.title")
        XCTAssertEqual(sut.image.absoluteString, "foo.com")
    }
}
