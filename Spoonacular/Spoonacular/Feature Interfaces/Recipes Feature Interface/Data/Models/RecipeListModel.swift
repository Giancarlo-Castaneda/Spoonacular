import Foundation

public struct RecipeListModel {

    // MARK: - Public Properties

    public let recipes: [RecipeModel]
    public let number: Int
    public let totalResults: Int

    // MARK: - Initialization

    public init(recipes: [RecipeModel], number: Int, totalResults: Int) {
        self.recipes = recipes
        self.number = number
        self.totalResults = totalResults
    }
}
