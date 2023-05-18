import Foundation

final class ConcreteRecipeDetailInteractor: RecipeDetailInteractor {

    // MARK: - Private Properties

    private let fetchRecipeDetailWorker: FetchRecipeDetailWorker
    private let addFavoriteWorker: AddFavoriteRecipeWorker

    // MARK: - Internal Properties

    var presenter: RecipeDetailInteractorOutput?

    // MARK: - Initialization

    init(fetchRecipeDetailWorker: FetchRecipeDetailWorker, addFavoriteWorker: AddFavoriteRecipeWorker) {
        self.fetchRecipeDetailWorker = fetchRecipeDetailWorker
        self.addFavoriteWorker = addFavoriteWorker
    }

    // MARK: - Internal Methods

    func markAsFavorite(recipe: RecipeInformationModel) {
        Task {
            do {
                let recipeToSave = FavoriteRecipeModel.map(model: recipe)

                try addFavoriteWorker.execute(recipe: recipeToSave)
            } catch {
                await presenter?.error(error)
            }
        }
    }

    func fetchRecipeDetail(id: String) {
        Task {
            do {
                await presenter?.loading()

                let detail = try await fetchRecipeDetailWorker.execute(id: id)

                await presenter?.fetchedRecipeDetail(detail: detail)
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
