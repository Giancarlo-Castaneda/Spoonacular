import Foundation

extension RecipeInformationModel {

    // MARK: - Initialization

    init(_ dto: RecipesInformationDTO) {
        let ingredients = dto.extendedIngredients.map { RecipeIngredientModel($0) }
        let detailedInstructions = dto.analyzedInstructions.map { RecipeInstructionModel($0) }

        self.init(isVegetarian: dto.vegetarian,
                  isVegan: dto.vegan,
                  isGlutenFree: dto.glutenFree,
                  isDairyFree: dto.dairyFree,
                  isHealthy: dto.veryHealthy,
                  isCheap: dto.cheap,
                  isPopular: dto.veryPopular,
                  ingredients: ingredients,
                  id: dto.id,
                  title: dto.title,
                  readyInMinutes: dto.readyInMinutes,
                  servings: dto.servings,
                  image: dto.image,
                  summary: dto.summary,
                  dishTypes: dto.dishTypes,
                  diets: dto.diets,
                  instructions: dto.instructions,
                  detailedInstructions: detailedInstructions)
    }
}
