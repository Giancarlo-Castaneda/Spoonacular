import Foundation

public struct RecipeInstructionModel {

    // MARK: Public Properties

    public let name: String
    public let steps: [RecipeInstructionStepModel]

    // MARK: Initialization

    public init(name: String, steps: [RecipeInstructionStepModel]) {
        self.name = name
        self.steps = steps
    }
}
