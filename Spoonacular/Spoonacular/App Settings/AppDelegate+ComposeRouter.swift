import Foundation

// MARK: - ComposeRouter

extension AppDelegate {

    func composeRouter() {
        let routeService = appDependency.routeService

        routeService.register(ConcreteRecipesListSceneRouteHandler(recipeRepository: appDependency.recipe.recipeRepository,
                                                                   routeService: appDependency.routeService))

        routeService.register(ConcreteRecipeDetailSceneRouteHandler(recipeRepository: appDependency.recipe.recipeRepository))
    }
}
