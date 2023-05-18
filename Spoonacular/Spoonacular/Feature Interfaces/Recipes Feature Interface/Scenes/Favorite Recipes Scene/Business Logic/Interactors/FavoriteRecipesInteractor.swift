import Foundation

public protocol FavoriteRecipesInteractor {

    func deleteFavorite(recipe: RecipeInformationModel)
    func fetchFavoriteRecipes()
}

public protocol FavoriteRecipesInteractorOutput {

    func fetchedFavoriteRecipes(recipes: [RecipeInformationModel]) async
    func loading() async
    func error(_ error: Error) async
}
