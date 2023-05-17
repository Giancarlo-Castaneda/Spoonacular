import Foundation

struct ConcreteRecipeViewModel: RecipeViewModel {

    // MARK: - Internal Properties

    let title: String
    let image: URL

    // MARK: - Initialization

    init(title: String, image: URL) {
        self.title = title
        self.image = image
    }
}
