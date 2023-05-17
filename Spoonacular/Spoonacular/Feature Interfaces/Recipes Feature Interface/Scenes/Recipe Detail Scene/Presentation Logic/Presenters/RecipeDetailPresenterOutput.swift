import Foundation

public protocol RecipeDetailPresenterOutput: AnyObject {

    @MainActor func configure(state: RecipeDetailViewState)
}

public enum RecipeDetailViewState {
    case content
    case failure(title: String, message: String)
    case loading
}
