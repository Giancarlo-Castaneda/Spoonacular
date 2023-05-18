import Foundation

public protocol DeleteFavoriteRecipeWorker {

    func execute(recipeId: Int) throws
}
