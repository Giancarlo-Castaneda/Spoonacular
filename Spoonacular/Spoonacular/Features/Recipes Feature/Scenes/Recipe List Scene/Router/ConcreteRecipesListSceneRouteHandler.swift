import UIKit

final class ConcreteRecipesListSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let recipeRepository: RecipeRepository
    private let routeService: RouteService

    // MARK: - Initialization

    init(recipeRepository: RecipeRepository, routeService: RouteService) {
        self.recipeRepository = recipeRepository
        self.routeService = routeService
    }

    // MARK: - Internal Methods

    func destination(of route: RecipesListRoute) -> UIViewController {
        RecipesListSceneFactory(recipeRepository: recipeRepository, routeService: routeService).build()
    }

    func navigate(to route: RecipesListRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.show(viewController, sender: nil)
    }
}
