import Foundation

extension RecipeInstructionModel {

    // MARK: - Initialization

    init (_ dto: RecipesInformationDTO.AnalyzedInstruction) {
        let steps = dto.steps.map { RecipeInstructionStepModel($0) }

        self.init(name: dto.name, steps: steps)
    }
}
