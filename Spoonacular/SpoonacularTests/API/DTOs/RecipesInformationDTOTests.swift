import XCTest

@testable import Spoonacular

final class RecipesInformationDTOTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipesInformationDTO

    // MARK: Private Properties

    private var sut: SUT!
    private var jsonDecoder: JSONDecoder!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        jsonDecoder = Helper.makeJSONDecoder()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        jsonDecoder = nil
    }

    // MARK: Tests

    func test_initWithDecoder_givenValues_shouldSetValues() throws {
        let data = try Helper.makeRecipesInformationDTOData()
        sut = try jsonDecoder.decode(SUT.self, from: data)

        XCTAssertFalse(sut.vegetarian)
        XCTAssertFalse(sut.vegan)
        XCTAssertFalse(sut.dairyFree)
        XCTAssertTrue(sut.veryHealthy)
        XCTAssertFalse(sut.cheap)
        XCTAssertFalse(sut.veryPopular)
        XCTAssertFalse(sut.glutenFree)

        XCTAssertEqual(sut.id, 3333)
        XCTAssertEqual(sut.title, "foo.title")
        XCTAssertEqual(sut.readyInMinutes, 4444)
        XCTAssertEqual(sut.servings, 5555)
        XCTAssertEqual(sut.image.absoluteString, "foo.com/images.jpg")
        XCTAssertEqual(sut.imageType.rawValue, "jpg")
        XCTAssertEqual(sut.summary, "foo.summary")
        XCTAssertEqual(sut.instructions, "foo.instructions")

        XCTAssertEqual(sut.dishTypes[0], "foo.0.dish_types")
        XCTAssertEqual(sut.diets[0], "foo.0.diets")

        XCTAssertEqual(sut.extendedIngredients[0].id, 1111)
        XCTAssertEqual(sut.extendedIngredients[0].image, "foo.extendedIngredients.0.image")
        XCTAssertEqual(sut.extendedIngredients[0].consistency, "foo.extendedIngredients.0.consistency")
        XCTAssertEqual(sut.extendedIngredients[0].original, "foo.extendedIngredients.0.original")
        XCTAssertEqual(sut.extendedIngredients[0].amount, 0.11)
        XCTAssertEqual(sut.extendedIngredients[0].unit, "foo.extendedIngredients.0.unit")

        XCTAssertEqual(sut.analyzedInstructions[0].name, "foo.analyzedInstructions.0.name")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].number, 6666)
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].step, "foo.analyzedInstructions.0.steps.0.step")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].ingredients[0].id, 7777)
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].ingredients[0].name,
                       "foo.analyzedInstructions.0.steps.0.ingredients.0.name")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].ingredients[0].localizedName,
                       "foo.analyzedInstructions.0.steps.0.ingredients.0.localizedName")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].ingredients[0].image,
                       "foo.analyzedInstructions.0.steps.0.ingredients.0.image")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].equipment[0].id, 8888)
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].equipment[0].name,
                       "foo.analyzedInstructions.0.steps.0.equipment.0.name")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].equipment[0].localizedName,
                       "foo.analyzedInstructions.0.steps.0.equipment.0.localizedName")
        XCTAssertEqual(sut.analyzedInstructions[0].steps[0].equipment[0].image,
                       "foo.analyzedInstructions.0.steps.0.equipment.0.image")

    }
}
