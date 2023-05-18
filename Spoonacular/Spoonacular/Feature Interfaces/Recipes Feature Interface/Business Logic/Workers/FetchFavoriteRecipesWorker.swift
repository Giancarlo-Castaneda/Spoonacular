import Foundation

public protocol FetchFavoriteRecipesWorker {

    func execute() -> [RecipeInformationModel]
}
