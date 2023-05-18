import Foundation
import Spoonacular

final class MockRecipeViewModelFactory: RecipeViewModelFactory, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case makeRecipeViewModel
    }

    private var receivedTitle: String?
    private var receivedImage: URL?

    // MARK: - Internal Methods

    func makeRecipeViewModel(title: String, image: URL) -> RecipeViewModel {
        append(.makeRecipeViewModel)

        receivedTitle = title
        receivedImage = image

        return getStubValue(for: .makeRecipeViewModel) ?? MockRecipeViewModel(title: title, image: image)
    }
}
