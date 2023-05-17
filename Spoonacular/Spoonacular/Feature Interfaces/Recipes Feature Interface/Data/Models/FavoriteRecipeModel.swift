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
    @Persisted var ingredients: List<FavoriteRecipeIngredientModel>
    @Persisted var title: String
    @Persisted var readyInMinutes: Int
    @Persisted var servings: Int
    @Persisted var image: String
    @Persisted var summary: String
    @Persisted var dishTypes: List<String>
    @Persisted var diets: List<String>
    @Persisted var instructions: String
}
