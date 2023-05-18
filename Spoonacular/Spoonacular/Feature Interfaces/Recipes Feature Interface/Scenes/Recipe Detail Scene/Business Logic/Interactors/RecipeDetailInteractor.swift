import Foundation

public protocol RecipeDetailInteractor {

    func markAsFavorite(recipe: RecipeInformationModel)
    func fetchRecipeDetail(id: String)
}

public protocol RecipeDetailInteractorOutput {

    func fetchedRecipeDetail(detail: RecipeInformationModel) async
    func loading() async
    func noInternetConnection() async
    func error(_ error: Error) async
}
