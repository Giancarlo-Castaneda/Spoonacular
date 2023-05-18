import Foundation

final class ConcreteFetchRecipeDetailWorker: FetchRecipeDetailWorker {

    // MARK: - Private Properties

    private let repository: RecipeRepository

    // MARK: - Initialization

    init(repository: RecipeRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(id: String) async throws -> RecipeInformationModel {
        try await repository.fetchRecipeDetail(id: id)
    }
}
