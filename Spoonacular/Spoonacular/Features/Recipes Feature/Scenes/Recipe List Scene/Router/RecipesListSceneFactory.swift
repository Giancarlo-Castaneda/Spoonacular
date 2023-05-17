import UIKit

final class RecipesListSceneFactory {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchWorker = ConcreteFetchRecipeListWorker(repository: recipeRepository)
        let interactor = ConcreteRecipeListInteractor(fetchRecipeListWorker: fetchWorker)
        let viewModelFactory = ConcreteRecipeViewModelFactory()
        let dataProviderFactory = ConcreteRecipesDataProviderFactory(viewModelFactory: viewModelFactory)
        let presenter = ConcreteRecipesListPresenter(dataProviderFactory: dataProviderFactory)
        let viewController = RecipeListViewController()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
