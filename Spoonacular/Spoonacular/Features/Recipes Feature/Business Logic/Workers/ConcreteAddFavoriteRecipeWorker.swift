import Foundation

final class ConcreteAddFavoriteRecipeWorker: AddFavoriteRecipeWorker {

    // MARK: - Private Properties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func execute(recipe: FavoriteRecipeModel) throws {
        try repository.addFavorite(recipe: recipe)
    }
}
