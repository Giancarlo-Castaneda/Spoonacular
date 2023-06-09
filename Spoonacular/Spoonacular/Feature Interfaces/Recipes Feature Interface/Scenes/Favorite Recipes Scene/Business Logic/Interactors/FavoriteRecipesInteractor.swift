import Foundation

public protocol FavoriteRecipesInteractor {

    func deleteFavorite(recipeId: Int, indexPath: IndexPath)
    func fetchFavoriteRecipes()
}

public protocol FavoriteRecipesInteractorOutput {

    func fetchedFavoriteRecipes(recipes: [RecipeInformationModel]) async
    func loading() async
    func error(_ error: Error) async
}
