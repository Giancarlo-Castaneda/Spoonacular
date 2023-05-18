import Foundation

public protocol FavoriteRecipeViewModel {

    var title: String { get }
    var image: URL { get }
    var preparationTime: String { get }
}
