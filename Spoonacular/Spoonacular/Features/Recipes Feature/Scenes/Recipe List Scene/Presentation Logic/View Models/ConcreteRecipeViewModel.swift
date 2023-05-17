import Foundation

struct ConcreteRecipeViewModel: RecipeViewModel {

    // MARK: - Internal Properties

    let id: Int
    let title: String
    let image: URL

    // MARK: - Initialization

    init(id: Int, title: String, image: URL) {
        self.id = id
        self.title = title
        self.image = image
    }
}
