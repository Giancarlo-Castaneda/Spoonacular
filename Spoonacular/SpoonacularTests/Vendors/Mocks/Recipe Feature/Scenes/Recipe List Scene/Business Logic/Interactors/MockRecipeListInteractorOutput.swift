import Foundation
import Spoonacular
import XCTest

final class MockRecipeListInteractorOutput: RecipeListInteractorOutput, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case fetchedRecipes
        case loading
        case error
    }

    // MARK: - Internal Properties

    var receivedError: Error?
    var recevedRecipes: [RecipeModel] = []
    var expectation: XCTestExpectation?

    // MARK: - Internal Methods

    func fetchedRecipes(recipes: [RecipeModel]) async {
        append(.fetchedRecipes)

        recevedRecipes = recipes

        expectation?.fulfill()
    }

    func loading() async {
        append(.loading)
    }

    func error(_ error: Error) async {
        append(.error)

        receivedError = error

        expectation?.fulfill()
    }
}
