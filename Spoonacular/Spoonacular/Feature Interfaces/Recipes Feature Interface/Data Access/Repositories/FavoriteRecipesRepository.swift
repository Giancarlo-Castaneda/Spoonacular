import Foundation

public protocol FavoriteRecipesRepository {

    func addFavorite(recipe: FavoriteRecipeModel) async throws -> [RecipeInformationModel]
    func deleteFavorite(recipe: FavoriteRecipeModel) async throws -> [RecipeInformationModel]
}
