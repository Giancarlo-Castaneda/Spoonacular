import Foundation

public protocol DeleteFavoriteRecipeWorker {

    func execute(recipe: FavoriteRecipeModel) throws
}
