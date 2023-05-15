import Foundation

final class ConcreteFetchRecipeListWorker: FetchRecipeListWorker {

    // MARK: - Private Properties

    private let repository: RecipeRepository

    // MARK: - Initialization

    init(repository: RecipeRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(query: String) async throws -> RecipeListModel {
        try await repository.fetchRecipeList(query: query)
    }
}
