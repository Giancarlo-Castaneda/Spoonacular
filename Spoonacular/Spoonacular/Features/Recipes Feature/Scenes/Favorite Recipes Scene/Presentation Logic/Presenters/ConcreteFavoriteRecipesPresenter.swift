import Foundation

final class ConcreteFavoriteRecipesPresenter: FavoriteRecipesInteractorOutput {

    // MARK: - Internal Properties

    weak var view: FavoriteRecipesPresenterOutput?

    // MARK: - Internal Methods

    func fetchedFavoriteRecipes(recipes: [RecipeInformationModel]) async {
        let dataProvider = ConcreteFavoriteRecipesDataProvider(favoriteRecipes: recipes)

        await view?.configure(state: .content(dataProvider: dataProvider))

        if recipes.isEmpty {
            await view?.configure(state: .emptyRecipes)
        }
    }

    func loading() async {
        await view?.configure(state: .loading)
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
