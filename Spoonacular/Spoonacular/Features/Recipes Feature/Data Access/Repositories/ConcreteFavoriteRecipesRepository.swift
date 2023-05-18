import Foundation
import RealmSwift

final class ConcreteFavoriteRecipesRepository: FavoriteRecipesRepository {

    // MARK: - Internal Methods

    func fetchFavorites() -> [RecipeInformationModel] {
        let realmDB = try! Realm()

        let favorites = realmDB.objects(FavoriteRecipeModel.self)

        return favorites.map { RecipeInformationModel($0) }
    }

    func addFavorite(recipe: FavoriteRecipeModel) throws {
        let realmDB = try Realm()

        if let _ = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipe.id) {
            throw FavoriteRecipesRepositoryError.itemAlreadyExists
        }
        try realmDB.write {
            realmDB.add(recipe)
        }
    }

    func deleteFavorite(recipeId: Int) throws {
        let realmDB = try Realm()

        guard
            let recipeToDelete = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipeId)
        else { throw FavoriteRecipesRepositoryError.itemNotFound }

        try realmDB.write {
            realmDB.delete(recipeToDelete)
        }
    }
}
