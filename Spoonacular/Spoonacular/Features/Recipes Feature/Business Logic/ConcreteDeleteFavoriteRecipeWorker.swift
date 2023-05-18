import Foundation

final class ConcreteDeleteFavoriteRecipeWorker: DeleteFavoriteRecipeWorker {

    // MARK: - Private Propeties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(recipeId: Int) throws {
        try repository.deleteFavorite(recipeId: recipeId)
    }
}
