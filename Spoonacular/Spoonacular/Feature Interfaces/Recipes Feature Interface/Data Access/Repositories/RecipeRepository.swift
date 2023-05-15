import Foundation

public protocol RecipeRepository {

    func fetchRecipeList(query: String) async throws -> RecipeListModel
}
