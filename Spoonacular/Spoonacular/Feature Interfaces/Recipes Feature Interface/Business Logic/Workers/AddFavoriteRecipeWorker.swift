import Foundation

public protocol AddFavoriteRecipeWorker {

    func execute(recipe: FavoriteRecipeModel) throws
}
