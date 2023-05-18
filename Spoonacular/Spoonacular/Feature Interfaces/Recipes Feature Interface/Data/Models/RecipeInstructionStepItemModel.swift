import Foundation

public struct RecipeInstructionStepItemModel {

    // MARK: Public Properties

    public let id: Int
    public let name: String
    public let image: String

    // MARK: Initialization

    public init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
