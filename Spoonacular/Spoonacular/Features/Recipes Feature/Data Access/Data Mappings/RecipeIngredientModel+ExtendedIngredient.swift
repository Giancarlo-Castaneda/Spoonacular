import Foundation

extension RecipeIngredientModel {

    // MARK: - Initialization

    init(_ dto: RecipesInformationDTO.ExtendedIngredient) {
        self.init(id: dto.id,
                  image: dto.image,
                  consistency: dto.consistency,
                  name: dto.original,
                  amount: dto.amount,
                  unit: dto.unit)
    }
}
