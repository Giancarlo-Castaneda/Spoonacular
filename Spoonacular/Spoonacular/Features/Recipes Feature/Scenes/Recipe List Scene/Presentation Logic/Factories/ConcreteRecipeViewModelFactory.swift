import Foundation

final class ConcreteRecipeViewModelFactory: RecipeViewModelFactory {

    // MARK: - Internal Methods

    func makeRecipeViewModel(title: String, image: URL) -> RecipeViewModel {
        ConcreteRecipeViewModel(title: title, image: image)
    }
}
