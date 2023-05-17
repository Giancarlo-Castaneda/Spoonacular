import Foundation

public struct RecipeInformationModel {

    // MARK: Public Properties

    public let isVegetarian: Bool
    public let isVegan: Bool
    public let isGlutenFree: Bool
    public let isDairyFree: Bool
    public let isHealthy: Bool
    public let isCheap: Bool
    public let isPopular: Bool
    public let ingredients: [RecipeIngredientModel]
    public let id: Int
    public let title: String
    public let readyInMinutes: Int
    public let servings: Int
    public let image: URL
    public let summary: String
    public let dishTypes: [String]
    public let diets: [String]
    public let instructions: String
    public let detailedInstructions: [RecipeInstructionModel]

    // MARK: Initialization

    public init(isVegetarian: Bool,
                isVegan: Bool,
                isGlutenFree: Bool,
                isDairyFree: Bool,
                isHealthy: Bool,
                isCheap: Bool,
                isPopular: Bool,
                ingredients: [RecipeIngredientModel],
                id: Int,
                title: String,
                readyInMinutes: Int,
                servings: Int,
                image: URL,
                summary: String,
                dishTypes: [String],
                diets: [String],
                instructions: String,
                detailedInstructions: [RecipeInstructionModel]) {

        self.isVegetarian = isVegetarian
        self.isVegan = isVegan
        self.isGlutenFree = isGlutenFree
        self.isDairyFree = isDairyFree
        self.isHealthy = isHealthy
        self.isCheap = isCheap
        self.isPopular = isPopular
        self.ingredients = ingredients
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.image = image
        self.summary = summary
        self.dishTypes = dishTypes
        self.diets = diets
        self.instructions = instructions
        self.detailedInstructions = detailedInstructions
    }
}
