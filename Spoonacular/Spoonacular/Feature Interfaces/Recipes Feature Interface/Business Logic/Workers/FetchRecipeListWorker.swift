import Foundation

public protocol FetchRecipeListWorker {

    func execute(query: String, recipesPerPage: Int, offset: Int) async throws -> RecipeListModel
}
