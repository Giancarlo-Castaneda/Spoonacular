import Foundation

public protocol FavoriteRecipesPresenterOutput: AnyObject {

    @MainActor func configure(state: FavoriteRecipesViewState)
}

public enum FavoriteRecipesViewState {
    case emptyRecipes
    case content(dataProvider: FavoriteRecipesDataProvider)
    case failure(title: String, message: String)
    case loading
}
