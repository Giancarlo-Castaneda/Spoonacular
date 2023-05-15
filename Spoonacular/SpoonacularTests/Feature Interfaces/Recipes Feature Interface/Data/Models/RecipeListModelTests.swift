import XCTest

@testable import Spoonacular

final class RecipeListModelTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipeListModel

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

    func test_init_givenValues_shouldReturnValues() throws {
        let url = try XCTUnwrap(URL(string: "https://foo/0.com"))
        let recipe = try Helper.makeRecipeModel(id: 1111, title: "foo.recipe.0.title", image: url)

        sut = SUT(recipes: [recipe], number: 2222, totalResults: 3333)

        XCTAssertEqual(sut.totalResults, 3333)
        XCTAssertEqual(sut.number, 2222)
        XCTAssertEqual(sut.recipes[0].id, 1111)
        XCTAssertEqual(sut.recipes[0].image.absoluteString, "https://foo/0.com")
        XCTAssertEqual(sut.recipes[0].title, "foo.recipe.0.title")
    }
}
