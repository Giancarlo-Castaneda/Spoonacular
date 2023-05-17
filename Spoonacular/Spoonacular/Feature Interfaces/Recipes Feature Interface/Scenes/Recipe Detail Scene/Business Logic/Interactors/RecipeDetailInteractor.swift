import Foundation

public protocol RecipeDetailInteractor {

    func fetchRecipeDetail(id: String)
}

public protocol RecipeDetailInteractorOutput {

    func fetchedRecipeDetail(detail: RecipeInformationModel) async
    func loading() async
    func error(_ error: Error) async
}
