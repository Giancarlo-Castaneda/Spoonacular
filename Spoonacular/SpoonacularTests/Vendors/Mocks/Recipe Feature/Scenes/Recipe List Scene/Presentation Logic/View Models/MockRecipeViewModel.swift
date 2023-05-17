import Foundation
import Spoonacular

struct MockRecipeViewModel: RecipeViewModel {

    // MARK: - Internal Properties

    var title = ""
    var image = URL(string: "foo.com")!
}
