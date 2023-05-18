import Foundation

public protocol FavoriteRecipeViewModel {

    var id: Int { get }
    var title: String { get }
    var image: URL { get }
    var preparationTime: String { get }
}
