import UIKit

final class ConcreteRecipesListSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }

    // MARK: - Internal Methods

    func destination(of route: RecipesListRoute) -> UIViewController {
        RecipesListSceneFactory(recipeRepository: recipeRepository).build()
    }

    func navigate(to route: RecipesListRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.show(viewController, sender: nil)
    }
}
