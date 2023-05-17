import Foundation
import RealmSwift

final class ConcreteFavoriteRecipesRepository: FavoriteRecipesRepository {

    // MARK: - Private Properties

    private var realmDB: Realm!

    // MARK: - Initialization

    init() {
        self.realmDB = try! Realm()
    }

    // MARK: - Private Methods

    private func fetchFavorites() -> [RecipeInformationModel] {
        let favorites = realmDB.objects(FavoriteRecipeModel.self)

        return favorites.map { RecipeInformationModel($0) }
    }

    // MARK: - Internal Methods

    func addFavorite(recipe: FavoriteRecipeModel) async throws -> [RecipeInformationModel] {
        try await realmDB.asyncWrite {
            realmDB.add(recipe)
        }

        return fetchFavorites()
    }

    func deleteFavorite(recipe: FavoriteRecipeModel) async throws -> [RecipeInformationModel] {
        let objectId = try ObjectId(string: recipe.id.description)
        if let task = realmDB.object(ofType: FavoriteRecipeModel.self, forPrimaryKey: objectId) {
            try await realmDB.asyncWrite {
                self.realmDB.delete(recipe)
            }
        }

        return fetchFavorites()
    }
}
