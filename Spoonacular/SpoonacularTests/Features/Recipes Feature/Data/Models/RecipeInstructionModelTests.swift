import XCTest

@testable import Spoonacular

final class RecipeInstructionModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipeInstructionModel

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
        let step = Helper.makeRecipeInstructionStepModel(number: 111, description: "foo.step.description")
        sut = SUT(name: "foo.name", steps: [step])

        XCTAssertEqual(sut.name, "foo.name")
        XCTAssertEqual(sut.steps[0].number, 111)
        XCTAssertEqual(sut.steps[0].description, "foo.step.description")
    }
}
