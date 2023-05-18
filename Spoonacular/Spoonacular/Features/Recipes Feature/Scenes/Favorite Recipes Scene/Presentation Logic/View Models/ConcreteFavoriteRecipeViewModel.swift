import Foundation

struct ConcreteFavoriteRecipeViewModel: FavoriteRecipeViewModel {

    // MARK: - Internal Properties

    let id: Int
    let title: String
    let image: URL
    let preparationTime: String

    // MARK: - Initialization

    init(id: Int, title: String, image: URL, preparationTime: Int) {
        self.id = id
        self.title = title
        self.image = image
        self.preparationTime = preparationTime.description + " min"
    }
}
