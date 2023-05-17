import Foundation

struct AppDependency {

    // MARK: - Internal Properties

    let networkingProvider: NetworkingProvider
    let routeService: RouteService
    let recipe: Recipe
}

// MARK: - Resolve

extension AppDependency {

    static func resolve() -> Self {

        // MARK: JSONDecoder

        let jsonDecoder = JSONDecoder()

        // MARK: NetworkingProvider

        let networkingProvider = ConcreteNetworkingProvider(jsonDecoder: jsonDecoder)

        // MARK: RouteService

        let routeService = ConcreteRouteService()

        // MARK: Recipe

        let recipe = Recipe.resolve(networkingProvider: networkingProvider)

        return AppDependency(networkingProvider: networkingProvider,
                             routeService: routeService,
                             recipe: recipe)
    }
}
