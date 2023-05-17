import UIKit

final class AppRouter {

    // MARK: - Internal Properties

    static let shared = AppRouter()
    var window: UIWindow?

    // MARK: - Internal Methods

    func start() {
        let networkingProvider = ConcreteNetworkingProvider(jsonDecoder: JSONDecoder())
        let recipeRepository = ConcreteRecipeRepository(networkingProvider: networkingProvider)
        let vc = RecipesListSceneFactory(recipeRepository: recipeRepository).build()
        let navigationController = UINavigationController(rootViewController: vc)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
