import Foundation

public protocol RecipeViewModel {

    var id: Int { get }
    var title: String { get }
    var image: URL { get }
}
