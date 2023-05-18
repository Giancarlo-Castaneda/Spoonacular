import Foundation

public protocol RecipeRepository {

    func fetchRecipeList(query: String, recipesPerPage: Int, offset: Int) async throws -> RecipeListModel
    func fetchRecipeDetail(id: String) async throws -> RecipeInformationModel
}
