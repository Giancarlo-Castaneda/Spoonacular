import Foundation
import Spoonacular
import XCTest

extension Helper {

    static func makeRecipeModel(id: Int = 0, title: String = "", image: URL? = nil) throws -> RecipeModel {
        let image = try image ?? XCTUnwrap(URL(string: ""))

        return RecipeModel(id: id, title: title, image: image)
    }
}
