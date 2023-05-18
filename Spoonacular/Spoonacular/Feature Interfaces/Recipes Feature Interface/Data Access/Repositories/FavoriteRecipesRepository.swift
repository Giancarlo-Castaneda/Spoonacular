import Foundation

public protocol FavoriteRecipesRepository {

    func fetchFavorites() -> [RecipeInformationModel]
    func addFavorite(recipe: FavoriteRecipeModel) throws
    func deleteFavorite(recipeId: Int) throws
}
