import Foundation
import Spoonacular

final class MockRecipesDataProviderFactory: RecipesDataProviderFactory, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case makeRecipeListDataProvider
    }

    // MARK: - Internal Properties

    var receivedRecipes: [RecipeModel] = []

    // MARK: - Internal Methods

    func makeRecipeListDataProvider(recipes: [RecipeModel]) -> RecipeListDataProvider {
        append(.makeRecipeListDataProvider)

        receivedRecipes = recipes

        return getStubValue(for: .makeRecipeListDataProvider)
    }
}
