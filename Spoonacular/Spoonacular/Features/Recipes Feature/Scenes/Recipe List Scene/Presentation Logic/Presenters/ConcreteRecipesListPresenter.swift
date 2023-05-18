import Foundation

final class ConcreteRecipesListPresenter: RecipeListInteractorOutput {

    // MARK: - Private Properties

    private let dataProviderFactory: RecipesDataProviderFactory

    // MARK: - Internal Properties

    weak var view: RecipesListPresenterOutput?

    // MARK: - Initialization

    init(dataProviderFactory: RecipesDataProviderFactory) {
        self.dataProviderFactory = dataProviderFactory
    }

    // MARK: - Internal Methods

    func fetchedRecipes(recipes: [RecipeModel]) async {
        let dataProvider = dataProviderFactory.makeRecipeListDataProvider(recipes: recipes)

        await view?.configure(state: .content(dataProvider: dataProvider))
    }

    func noInternetConnection() async {
        await view?.configure(state: .failure(title: "Uups!", message: "Maybe you don't have internet connection"))
    }

    func loading() async {
        await view?.configure(state: .loading)
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
