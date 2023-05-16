import Foundation
import Spoonacular

final class MockRecipeRepository: RecipeRepository, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case fetchRecipeList
    }

    // MARK: - Internal Properties

    var receivedQuery: String?
    var receivedRecipesPerPage: Int?
    var receivedOffset: Int?

    // MARK: - Internal Methods

    func fetchRecipeList(query: String, recipesPerPage: Int, offset: Int) async throws -> RecipeListModel {
        append(.fetchRecipeList)

        receivedQuery = query
        receivedRecipesPerPage = recipesPerPage
        receivedOffset = offset

        if let error: Error = getStubOptionalValue(for: .fetchRecipeList) {
            throw error
        }

        return getStubValue(for: .fetchRecipeList)
    }
}
