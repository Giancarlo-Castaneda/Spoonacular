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
        let favorites = realmDB.objects(FavoriteRecipeModel.self)

        return favorites.map { RecipeInformationModel($0) }
    }

    func addFavorite(recipe: FavoriteRecipeModel) throws -> [RecipeInformationModel] {
        if let _ = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipe.id) {
            throw FavoriteRecipesRepositoryError.itemAlreadyExists
        }
        try realmDB.write {
            realmDB.add(recipe)
        }

        return fetchFavorites()
    }

    func deleteFavorite(recipe: FavoriteRecipeModel) throws -> [RecipeInformationModel] {
        guard
            let recipeToDelete = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: recipe.id)
        else { throw FavoriteRecipesRepositoryError.itemNotFound }

        try realmDB.write {
            realmDB.delete(recipeToDelete)
        }

        return fetchFavorites()
    }
}

public enum FavoriteRecipesRepositoryError: Error {
    case itemAlreadyExists
    case itemNotFound
}
