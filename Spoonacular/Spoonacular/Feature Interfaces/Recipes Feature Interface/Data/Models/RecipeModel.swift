import Foundation

public struct RecipeModel {

    // MARK: - Public Properties

    public let id: Int
    public let title: String
    public let image: URL

    // MARK: - Initialization

    public init(id: Int, title: String, image: URL) {
        self.id = id
        self.title = title
        self.image = image
    }
}
