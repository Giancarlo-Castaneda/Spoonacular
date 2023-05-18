import Foundation

extension RecipeListModel {

    // MARK: - Initialization

    init(_ dto: RecipesComplexSearchDTO) {
        let recipes = dto.results.map { RecipeModel($0) }

        self.init(recipes: recipes, number: dto.number, totalResults: dto.totalResults)
    }
}
