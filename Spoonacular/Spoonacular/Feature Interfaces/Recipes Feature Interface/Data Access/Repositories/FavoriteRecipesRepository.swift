import Foundation

public protocol FavoriteRecipesRepository {

    func fetchFavorites() -> [RecipeInformationModel]
    func addFavorite(recipe: FavoriteRecipeModel) throws
    func deleteFavorite(recipe: FavoriteRecipeModel) throws
}
