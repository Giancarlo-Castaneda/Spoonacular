import Foundation

struct ConcreteFavoriteRecipeViewModel: FavoriteRecipeViewModel {

    // MARK: - Internal Properties

    let title: String
    let image: URL
    let preparationTime: String

    // MARK: - Initialization

    init(title: String, image: URL, preparationTime: Int) {
        self.title = title
        self.image = image
        self.preparationTime = preparationTime.description + " min"
    }
}
