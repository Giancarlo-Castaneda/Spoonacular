import XCTest

@testable import Spoonacular

final class RecipeInstructionStepModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipeInstructionStepModel

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
        let ingredient = Helper.makeRecipeInstructionStepItemModel(id: 1111,
                                                                   name: "foo.ingredient.name",
                                                                   image: "foo.ingredient.image")
        let equipment = Helper.makeRecipeInstructionStepItemModel(id: 2222,
                                                                   name: "foo.equipment.name",
                                                                   image: "foo.equipment.image")
        sut = SUT(number: 3333, description: "foo.description", ingredients: [ingredient], equipment: [equipment])

        XCTAssertEqual(sut.number, 3333)
        XCTAssertEqual(sut.description, "foo.description")
        XCTAssertEqual(sut.ingredients[0].id, 1111)
        XCTAssertEqual(sut.ingredients[0].name, "foo.ingredient.name")
        XCTAssertEqual(sut.ingredients[0].image, "foo.ingredient.image")
        XCTAssertEqual(sut.equipment[0].id, 2222)
        XCTAssertEqual(sut.equipment[0].name, "foo.equipment.name")
        XCTAssertEqual(sut.equipment[0].image, "foo.equipment.image")
    }
}
