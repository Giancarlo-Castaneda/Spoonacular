import Foundation

public protocol FetchRecipeListWorker {

    func execute(query: String) async throws -> RecipeListModel
}
