import Foundation
import RealmSwift

public class FavoriteRecipeModel: Object {

    @Persisted(primaryKey: true) var id: Int
    @Persisted var isVegetarian: Bool
    @Persisted var isVegan: Bool
    @Persisted var isGlutenFree: Bool
    @Persisted var isDairyFree: Bool
    @Persisted var isHealthy: Bool
    @Persisted var isCheap: Bool
    @Persisted var isPopular: Bool
    @Persisted var ingredients = List<FavoriteRecipeIngredientModel>()
    @Persisted var title: String
    @Persisted var readyInMinutes: Int
    @Persisted var servings: Int
    @Persisted var image: String
    @Persisted var summary: String
    @Persisted var dishTypes = List<String>()
    @Persisted var diets = List<String>()
    @Persisted var instructions: String

    static func map(model: RecipeInformationModel) -> FavoriteRecipeModel {
        let favorite = FavoriteRecipeModel()

        favorite.isVegetarian = model.isVegetarian
        favorite.isVegan = model.isVegan
        favorite.isGlutenFree = model.isGlutenFree
        favorite.isDairyFree = model.isDairyFree
        favorite.isHealthy = model.isHealthy
        favorite.isCheap = model.isCheap
        favorite.isPopular = model.isPopular
        favorite.ingredients.append(objectsIn: model.ingredients.map { FavoriteRecipeIngredientModel.map(model: $0)} )
        favorite.title = model.title
        favorite.readyInMinutes = model.readyInMinutes
        favorite.servings = model.servings
        favorite.image = model.image?.absoluteString ?? ""
        favorite.summary = model.summary
        favorite.instructions = model.instructions
        favorite.dishTypes.append(objectsIn: model.dishTypes)
        favorite.diets.append(objectsIn: model.diets)

        return favorite
    }
}
