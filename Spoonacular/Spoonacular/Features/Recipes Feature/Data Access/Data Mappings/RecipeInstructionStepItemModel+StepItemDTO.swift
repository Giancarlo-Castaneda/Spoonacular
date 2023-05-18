import Foundation

extension RecipeInstructionStepItemModel {

    // MARK: - Initialization

    init(_ dto: RecipesInformationDTO.AnalyzedInstruction.Step.StepItem) {
        self.init(id: dto.id, name: dto.name, image: dto.image)
    }
}
