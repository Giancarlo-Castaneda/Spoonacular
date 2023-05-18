import Foundation

final class ConcreteFavoriteRecipesInteractor: FavoriteRecipesInteractor {

    // MARK: - Private Properties

    private let fetchFavoriteWorker: FetchFavoriteRecipesWorker
    private let deleteFavoriteWorker: DeleteFavoriteRecipeWorker

    // MARK: - Internal Properties

    var presenter: FavoriteRecipesInteractorOutput?

    // MARK: - Initialization

    init(fetchFavoriteWorker: FetchFavoriteRecipesWorker, deleteFavoriteWorker: DeleteFavoriteRecipeWorker) {
        self.fetchFavoriteWorker = fetchFavoriteWorker
        self.deleteFavoriteWorker = deleteFavoriteWorker
    }

    // MARK: - Internal Methods

    func deleteFavorite(recipeId: Int, indexPath: IndexPath) {
        Task {
            do {
                await presenter?.loading()

                try deleteFavoriteWorker.execute(recipeId: recipeId)

                let favoriteRecipes = fetchFavoriteWorker.execute()
                await presenter?.fetchedFavoriteRecipes(recipes: favoriteRecipes)
            } catch {
                await presenter?.error(error)
            }
        }
    }

    func fetchFavoriteRecipes() {
        Task {
            await presenter?.loading()

            let favoriteRecipes = fetchFavoriteWorker.execute()

            await presenter?.fetchedFavoriteRecipes(recipes: favoriteRecipes)
        }
    }
}
