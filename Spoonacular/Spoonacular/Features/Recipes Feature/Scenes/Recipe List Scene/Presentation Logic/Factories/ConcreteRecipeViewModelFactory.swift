import Foundation

final class ConcreteRecipeViewModelFactory: RecipeViewModelFactory {

    // MARK: - Internal Methods

    func makeRecipeViewModel(id: Int, title: String, image: URL) -> RecipeViewModel {
        ConcreteRecipeViewModel(id: id, title: title, image: image)
    }
}
