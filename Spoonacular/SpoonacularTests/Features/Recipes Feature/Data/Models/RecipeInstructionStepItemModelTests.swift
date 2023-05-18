import XCTest

@testable import Spoonacular

final class RecipeInstructionStepItemModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipeInstructionStepItemModel

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

    func test_init_givenValues_shouldReturnValues() {
        sut = SUT(id: 1111, name: "foo.name", image: "foo.image")

        XCTAssertEqual(sut.id, 1111)
        XCTAssertEqual(sut.name, "foo.name")
        XCTAssertEqual(sut.image, "foo.image")
    }
}
