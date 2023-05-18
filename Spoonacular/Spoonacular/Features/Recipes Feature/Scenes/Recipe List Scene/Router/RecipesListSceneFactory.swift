import UIKit

final class RecipesListSceneFactory {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository
    private let routeService: RouteService

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository, routeService: RouteService) {
        self.recipeRepository = recipeRepository
        self.routeService = routeService
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchWorker = ConcreteFetchRecipeListWorker(repository: recipeRepository)
        let isInternetReachableWorker = ConcreteIsInternetReachableWorker()
        let interactor = ConcreteRecipeListInteractor(fetchRecipeListWorker: fetchWorker,
                                                      isInternetReachableWorker: isInternetReachableWorker)
        let viewModelFactory = ConcreteRecipeViewModelFactory()
        let dataProviderFactory = ConcreteRecipesDataProviderFactory(viewModelFactory: viewModelFactory)
        let presenter = ConcreteRecipesListPresenter(dataProviderFactory: dataProviderFactory)
        let viewController = RecipeListViewController(routeService: routeService)

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
