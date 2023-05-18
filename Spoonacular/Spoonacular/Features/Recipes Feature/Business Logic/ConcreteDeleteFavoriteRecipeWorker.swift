import Foundation

final class ConcreteDeleteFavoriteRecipeWorker: DeleteFavoriteRecipeWorker {

    // MARK: - Private Propeties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(recipe: FavoriteRecipeModel) throws {
        try repository.deleteFavorite(recipe: recipe)
    }
}
