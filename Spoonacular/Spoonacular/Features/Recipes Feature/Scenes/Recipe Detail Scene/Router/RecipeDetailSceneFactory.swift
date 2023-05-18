import UIKit

final class RecipeDetailSceneFactory {

    // MARK: - Private Properties

    private let recipeId: String
    private let recipeRepository: RecipeRepository
    private let favoriteRecipeRepository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(recipeId: String, recipeRepository: RecipeRepository, favoriteRecipeRepository: FavoriteRecipesRepository) {
        self.recipeId = recipeId
        self.recipeRepository = recipeRepository
        self.favoriteRecipeRepository = favoriteRecipeRepository
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let addFavoriteWorker = ConcreteAddFavoriteRecipeWorker(repository: favoriteRecipeRepository)
        let fetchRecipeDetailWorker = ConcreteFetchRecipeDetailWorker(repository: recipeRepository)
        let interactor = ConcreteRecipeDetailInteractor(fetchRecipeDetailWorker: fetchRecipeDetailWorker,
                                                        addFavoriteWorker: addFavoriteWorker)
        let presenter = ConcreteRecipeDetailPresenter()
        let viewController = RecipeDetailViewController(recipeId: recipeId)

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
