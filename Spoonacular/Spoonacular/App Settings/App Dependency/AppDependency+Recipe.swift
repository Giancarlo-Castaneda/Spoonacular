import Foundation

extension AppDependency {

    struct Recipe {

        // MARK: - Internal Properties

        let recipeRepository: RecipeRepository
        let favoriteRecipesRepository: FavoriteRecipesRepository

        // MARK: - Internal Methods

        static func resolve(networkingProvider: NetworkingProvider) -> Self {
            let recipeRepository = ConcreteRecipeRepository(networkingProvider: networkingProvider)
            let favoriteRecipesRepository = ConcreteFavoriteRecipesRepository()

            return Recipe(recipeRepository: recipeRepository, favoriteRecipesRepository: favoriteRecipesRepository)
        }
    }
}
