import Foundation

public protocol RecipeListDataProvider {

    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func viewModel(at indexPath: IndexPath) -> RecipeViewModel?
}
