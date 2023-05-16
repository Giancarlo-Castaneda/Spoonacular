import Foundation

final class ConcreteFetchRecipeListWorker: FetchRecipeListWorker {

    // MARK: - Private Properties

    private let repository: RecipeRepository

    // MARK: - Initialization

    init(repository: RecipeRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(query: String, recipesPerPage: Int, offset: Int) async throws -> RecipeListModel {
        try await repository.fetchRecipeList(query: query, recipesPerPage: recipesPerPage, offset: offset)
    }
}
