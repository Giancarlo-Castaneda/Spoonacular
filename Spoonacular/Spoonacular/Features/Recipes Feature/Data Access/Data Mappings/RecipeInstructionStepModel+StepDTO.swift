import Foundation

extension RecipeInstructionStepModel {

    // MARK: - Initialization

    init(_ dto: RecipesInformationDTO.AnalyzedInstruction.Step) {
        let ingredients = dto.ingredients.map { RecipeInstructionStepItemModel($0) }
        let equipment = dto.equipment.map { RecipeInstructionStepItemModel($0) }

        self.init(number: dto.number, description: dto.step, ingredients: ingredients, equipment: equipment)
    }
}
