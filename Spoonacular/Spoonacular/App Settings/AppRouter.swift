import UIKit

final class AppRouter {

    // MARK: - Internal Properties

    static let shared = AppRouter()
    var window: UIWindow?

    // MARK: - Internal Methods

    func start() {
        guard
            let rootViewController = window?.rootViewController
        else {
            let navigationController = UINavigationController(nibName: nil, bundle: nil)

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            appDependency.routeService.navigate(to: RecipesListRoute(),
                                                from: navigationController,
                                                presentationStyle: .currentContext)
            return
        }

        appDependency.routeService.navigate(to: RecipesListRoute(),
                                            from: rootViewController,
                                            presentationStyle: .currentContext)
    }
}
