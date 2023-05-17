import UIKit

final class RecipeDetailSceneFactory {

    // MARK: - Private Properties

    private let recipeId: String
    private let recipeRepository: RecipeRepository

    // MARK: - Initialization

    init(recipeId: String, recipeRepository: RecipeRepository) {
        self.recipeId = recipeId
        self.recipeRepository = recipeRepository
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchRecipeDetailWorker = ConcreteFetchRecipeDetailWorker(repository: recipeRepository)
        let interactor = ConcreteRecipeDetailInteractor(fetchRecipeDetailWorker: fetchRecipeDetailWorker)
        let presenter = ConcreteRecipeDetailPresenter()
        let viewController = RecipeDetailViewController(recipeId: recipeId)

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
