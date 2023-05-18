import Foundation

public protocol RecipeListInteractor {

    func fetchRecipes(query: String)
}

public protocol RecipeListInteractorOutput {

    func fetchedRecipes(recipes: [RecipeModel]) async
    func noInternetConnection() async
    func loading() async
    func error(_ error: Error) async
}
