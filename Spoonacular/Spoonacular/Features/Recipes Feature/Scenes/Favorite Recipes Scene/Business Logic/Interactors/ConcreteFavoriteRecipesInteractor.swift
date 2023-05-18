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

    func deleteFavorite(recipe: RecipeInformationModel) {
        Task {
            do {
                await presenter?.loading()

                let recipeToDelete = FavoriteRecipeModel()
                recipeToDelete.id = recipe.id
                recipeToDelete.image = recipe.image?.absoluteString ?? ""

                try deleteFavoriteWorker.execute(recipe: recipeToDelete)

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
