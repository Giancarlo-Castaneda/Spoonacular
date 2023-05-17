import Foundation

public protocol RecipesDataProviderFactory {

    func makeRecipeListDataProvider(recipes: [RecipeModel]) -> RecipeListDataProvider
}
