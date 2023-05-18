import Foundation

public protocol FetchRecipeDetailWorker {

    func execute(id: String) async throws -> RecipeInformationModel
}
