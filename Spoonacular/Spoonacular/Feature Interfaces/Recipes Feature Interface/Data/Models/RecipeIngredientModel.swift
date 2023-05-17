import Foundation

public struct RecipeIngredientModel {

    // MARK: Public Properties

    public let id: Int
    public let image: String
    public let consistency: String
    public let name: String
    public let amount: Double
    public let unit: String

    // MARK: Initialization

    public init(id: Int, image: String, consistency: String, name: String, amount: Double, unit: String) {
        self.id = id
        self.image = image
        self.consistency = consistency
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}
