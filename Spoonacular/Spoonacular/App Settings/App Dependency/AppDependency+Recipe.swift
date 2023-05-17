import Foundation

extension AppDependency {

    struct Recipe {

        // MARK: - Internal Properties

        let recipeRepository: RecipeRepository

        // MARK: - Internal Methods

        static func resolve(networkingProvider: NetworkingProvider) -> Self {
            let recipeRepository = ConcreteRecipeRepository(networkingProvider: networkingProvider)

            return Recipe(recipeRepository: recipeRepository)
        }
    }
}
