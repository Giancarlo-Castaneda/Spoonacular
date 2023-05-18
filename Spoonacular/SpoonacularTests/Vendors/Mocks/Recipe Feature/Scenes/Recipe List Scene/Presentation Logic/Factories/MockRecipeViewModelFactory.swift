import Foundation
import Spoonacular

final class MockRecipeViewModelFactory: RecipeViewModelFactory, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case makeRecipeViewModel
    }

    var receivedId: Int?
    var receivedTitle: String?
    var receivedImage: URL?

    // MARK: - Internal Methods

    func makeRecipeViewModel(id: Int, title: String, image: URL) -> RecipeViewModel {
        append(.makeRecipeViewModel)

        receivedId = id
        receivedTitle = title
        receivedImage = image

        return getStubValue(for: .makeRecipeViewModel) ?? MockRecipeViewModel(title: title, image: image)
    }
}
