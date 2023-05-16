import Foundation
import Spoonacular

final class MockFetchRecipeListWorker: FetchRecipeListWorker, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case execute
    }

    // MARK: - Internal Properties

    var receivedQuery: String?
    var receivedRecipesPerPage: Int?
    var receivedOffset: Int?

    // MARK: - Internal Methods

    func execute(query: String, recipesPerPage: Int, offset: Int) async throws -> RecipeListModel {
        append(.execute)

        receivedQuery = query
        receivedRecipesPerPage = recipesPerPage
        receivedOffset = offset

        if let error: Error = getStubOptionalValue(for: .execute) {
            throw error
        }

        return getStubValue(for: .execute)
    }
}
