import Foundation

public struct RecipeInstructionStepModel {

    // MARK: - Public Properties

    public let number: Int
    public let description: String
    public let ingredients: [RecipeInstructionStepItemModel]
    public let equipment: [RecipeInstructionStepItemModel]

    // MARK: - Initialization

    public init(number: Int,
                description: String,
                ingredients: [RecipeInstructionStepItemModel],
                equipment: [RecipeInstructionStepItemModel]) {

        self.number = number
        self.description = description
        self.ingredients = ingredients
        self.equipment = equipment
    }
}
