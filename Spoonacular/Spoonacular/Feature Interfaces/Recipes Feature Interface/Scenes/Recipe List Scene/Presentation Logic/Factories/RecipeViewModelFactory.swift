import Foundation

public protocol RecipeViewModelFactory {

    func makeRecipeViewModel(title: String, image: URL) -> RecipeViewModel
}
