import Foundation

extension RecipeInformationModel {

    // MARK: - Initialization

    init(_ realmData: FavoriteRecipeModel) {
        let ingredients: [RecipeIngredientModel] = realmData.ingredients.map { RecipeIngredientModel($0) }
        let dishTypes: [String] = realmData.dishTypes.map { $0.description }
        let diets: [String] = realmData.diets.map { $0.description }

        self.init(isVegetarian: realmData.isVegetarian,
                  isVegan: realmData.isVegan,
                  isGlutenFree: realmData.isGlutenFree,
                  isDairyFree: realmData.isDairyFree,
                  isHealthy: realmData.isHealthy,
                  isCheap: realmData.isCheap,
                  isPopular: realmData.isPopular,
                  ingredients: ingredients,
                  id: realmData.id,
                  title: realmData.title,
                  readyInMinutes: realmData.readyInMinutes,
                  servings: realmData.servings,
                  image: URL(string: realmData.image),
                  summary: realmData.summary,
                  dishTypes: dishTypes,
                  diets: diets,
                  instructions: realmData.instructions,
                  detailedInstructions: [])
    }
}
