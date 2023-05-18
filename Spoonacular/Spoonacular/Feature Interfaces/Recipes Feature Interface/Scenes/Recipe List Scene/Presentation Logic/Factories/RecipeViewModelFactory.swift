import Foundation

public protocol RecipeViewModelFactory {

    func makeRecipeViewModel(id: Int, title: String, image: URL) -> RecipeViewModel
}
