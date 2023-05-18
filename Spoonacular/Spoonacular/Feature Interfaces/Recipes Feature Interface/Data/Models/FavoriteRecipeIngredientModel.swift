import Foundation
import RealmSwift

public class FavoriteRecipeIngredientModel: Object {

    @Persisted var id: Int
    @Persisted var image: String
    @Persisted var consistency: String
    @Persisted var name: String
    @Persisted var amount: Double
    @Persisted var unit: String

    static func map(model: RecipeIngredientModel) -> FavoriteRecipeIngredientModel {
        let instance = FavoriteRecipeIngredientModel()

        instance.id = model.id
        instance.image = model.image ?? ""
        instance.consistency = model.consistency
        instance.name = model.name
        instance.amount = model.amount
        instance.unit = model.unit

        return instance
    }
}
