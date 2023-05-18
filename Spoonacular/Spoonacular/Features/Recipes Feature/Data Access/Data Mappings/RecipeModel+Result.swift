import Foundation

extension RecipeModel {

    // MARK: - Initialization

    init(_ dto: RecipesComplexSearchDTO.Result) {
        self.init(id: dto.id, title: dto.title, image: dto.image)
    }
}
