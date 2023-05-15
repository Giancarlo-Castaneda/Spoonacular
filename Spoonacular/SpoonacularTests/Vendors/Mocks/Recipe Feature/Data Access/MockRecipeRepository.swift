import Foundation
import Spoonacular

final class MockRecipeRepository: RecipeRepository, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case fetchRecipeList
    }

    // MARK: - Internal Properties

    var receivedQuery: String?

    // MARK: - Internal Methods

    func fetchRecipeList(query: String) async throws -> RecipeListModel {
        append(.fetchRecipeList)

        receivedQuery = query

        if let error: Error = getStubOptionalValue(for: .fetchRecipeList) {
            throw error
        }

        return getStubValue(for: .fetchRecipeList)
    }
}
