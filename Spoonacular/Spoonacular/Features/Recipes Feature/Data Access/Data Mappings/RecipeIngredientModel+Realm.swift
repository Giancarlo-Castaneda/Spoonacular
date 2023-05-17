import Foundation

extension RecipeIngredientModel {

    // MARK: - Initialization

    init(_ realmData: FavoriteRecipeIngredientModel) {
        self.init(id: realmData.id,
                  image: realmData.image,
                  consistency: realmData.consistency,
                  name: realmData.name,
                  amount: realmData.amount,
                  unit: realmData.unit)
    }
}
