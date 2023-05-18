import UIKit

final class ConcreteRecipeDetailSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository
    private let favoriteRecipeRepository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository, favoriteRecipeRepository: FavoriteRecipesRepository) {
        self.recipeRepository = recipeRepository
        self.favoriteRecipeRepository = favoriteRecipeRepository
    }

    // MARK: - Internal Methods

    func destination(of route: RecipeDetailRoute) -> UIViewController {
        RecipeDetailSceneFactory(recipeId: route.id,
                                 recipeRepository: recipeRepository,
                                 favoriteRecipeRepository: favoriteRecipeRepository).build()
    }

    func navigate(to route: RecipeDetailRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.show(viewController, sender: nil)
    }
}
