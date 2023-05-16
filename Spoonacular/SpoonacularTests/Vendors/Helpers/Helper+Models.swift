import Foundation
import Spoonacular
import XCTest

extension Helper {

    static func makeRecipeModel(id: Int = 0, title: String = "", image: URL? = nil) throws -> RecipeModel {
        let image = try image ?? XCTUnwrap(URL(string: "foo.com"))

        return RecipeModel(id: id, title: title, image: image)
    }

    static func makeRecipeListModel(recipes: [RecipeModel] = [],
                                    number: Int = 0,
                                    totalResults: Int = 0) -> RecipeListModel {

        .init(recipes: recipes, number: number, totalResults: totalResults)
    }
}
