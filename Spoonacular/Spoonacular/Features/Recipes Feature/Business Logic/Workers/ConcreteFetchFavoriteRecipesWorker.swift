import Foundation

final class ConcreteFetchFavoriteRecipesWorker: FetchFavoriteRecipesWorker {

    // MARK: - Private Properties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute() -> [RecipeInformationModel] {
        repository.fetchFavorites()
    }
}
