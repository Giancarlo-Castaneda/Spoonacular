import Foundation

public protocol FavoriteRecipesDataProvider {

    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func viewModel(at indexPath: IndexPath) -> FavoriteRecipeViewModel?
}
