import Foundation
import Spoonacular

final class MockFetchRecipeListWorker: FetchRecipeListWorker, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case execute
    }

    // MARK: - Internal Properties

    var receivedQuery: String?

    // MARK: - Internal Methods

    func execute(query: String) async throws -> RecipeListModel {
        append(.execute)

        receivedQuery = query

        if let error: Error = getStubOptionalValue(for: .execute) {
            throw error
        }

        return getStubValue(for: .execute)
    }
}
