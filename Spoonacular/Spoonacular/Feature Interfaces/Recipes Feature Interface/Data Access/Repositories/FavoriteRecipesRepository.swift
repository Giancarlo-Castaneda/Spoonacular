import Foundation

public protocol FavoriteRecipesRepository {

    func fetchFavorites() -> [RecipeInformationModel]
    func addFavorite(recipe: FavoriteRecipeModel) throws -> [RecipeInformationModel]
    func deleteFavorite(recipe: FavoriteRecipeModel) throws -> [RecipeInformationModel]
}
