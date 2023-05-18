import Foundation
import Spoonacular

struct MockRecipeViewModel: RecipeViewModel {

    // MARK: - Internal Properties

    var id = 0
    var title = ""
    var image = URL(string: "foo.com")!
}
