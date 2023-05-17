import Foundation
import RealmSwift

public class FavoriteRecipeIngredientModel: Object {

    @Persisted var id: Int
    @Persisted var image: String
    @Persisted var consistency: String
    @Persisted var name: String
    @Persisted var amount: Double
    @Persisted var unit: String
}
