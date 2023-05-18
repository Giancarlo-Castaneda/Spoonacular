import UIKit

final class ConcreteFavoriteRecipesSceneRouteHandler: RouteHandler {

    // MARK: - Private Properties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func destination(of route: FavoriteRecipesRoute) -> UIViewController {
        FavoriteRecipesSceneFactory(repository: repository).build()
    }

    func navigate(to route: FavoriteRecipesRoute,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        let viewController = destination(of: route)
        viewController.view.tintColor = presentingViewController.view.tintColor

        presentingViewController.present(viewController, animated: true)
    }
}
