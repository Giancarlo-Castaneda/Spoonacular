import Foundation
import RealmSwift

final class ConcreteFavoriteRecipesRepository: FavoriteRecipesRepository {

    // MARK: - Private Properties

    private var realmDB: Realm!

    // MARK: - Initialization

    init() {
        realmDB = try! Realm()
    }

    // MARK: - Internal Methods

    func fetchFavorites() -> [RecipeInformationModel] {
        realmDB = try! Realm()

        let favorites = realmDB.objects(FavoriteRecipeModel.self)

        return favorites.map { RecipeInformationModel($0) }
    }

    func addFavorite(recipe: FavoriteRecipeModel) throws {
        if let _ = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipe.id) {
            throw FavoriteRecipesRepositoryError.itemAlreadyExists
        }
        try realmDB.write {
            realmDB.add(recipe)
        }
    }

    func deleteFavorite(recipe: FavoriteRecipeModel) throws {
        guard
            let recipeToDelete = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipe.id)
        else { throw FavoriteRecipesRepositoryError.itemNotFound }

        try realmDB.write {
            realmDB.delete(recipeToDelete)
        }
    }
}
