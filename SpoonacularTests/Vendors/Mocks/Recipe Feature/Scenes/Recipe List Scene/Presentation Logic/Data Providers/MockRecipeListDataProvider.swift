import Foundation
import Spoonacular

final class MockRecipeListDataProvider: RecipeListDataProvider, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case numberOfSections
        case numberOfRows
        case viewModel
    }

    // MARK: - Internal Methods

    func numberOfSections() -> Int {
        getStubValue(for: .numberOfSections)
    }

    func numberOfRows(inSection section: Int) -> Int {
        getStubValue(for: .numberOfRows)
    }

    func viewModel(at indexPath: IndexPath) -> RecipeViewModel? {
        if let viewModels: [RecipeViewModel] = getStubOptionalValue(for: .viewModel) {
            return viewModels[indexPath.row]
        }

        return getStubOptionalValue(for: .viewModel)
    }
}
