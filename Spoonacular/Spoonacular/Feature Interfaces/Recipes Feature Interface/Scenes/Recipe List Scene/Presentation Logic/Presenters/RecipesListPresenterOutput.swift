import Foundation

public protocol RecipesListPresenterOutput: AnyObject {

    @MainActor func configure(state: RecipeListViewState)
}

public enum RecipeListViewState {
    case content(dataProvider: RecipeListDataProvider)
    case failure(title: String, message: String)
    case loading
}
