import UIKit

final class ConcreteRecipeDetailSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    // MARK: - Internal Methods

    func destination(of route: RecipeDetailRoute) -> UIViewController {
        RecipesListSceneFactory(recipeRepository: recipeRepository).build()
    }

    func navigate(to route: RecipeDetailRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.show(viewController, sender: nil)
    }
}
