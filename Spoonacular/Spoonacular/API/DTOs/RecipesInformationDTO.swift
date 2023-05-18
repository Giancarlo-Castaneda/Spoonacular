import Foundation

public struct RecipesInformationDTO: Decodable {

    // MARK: Public Properties

    public let vegetarian: Bool
    public let vegan: Bool
    public let glutenFree: Bool
    public let dairyFree: Bool
    public let veryHealthy: Bool
    public let cheap: Bool
    public let veryPopular: Bool
    public let extendedIngredients: [ExtendedIngredient]
    public let id: Int
    public let title: String
    public let readyInMinutes: Int
    public let servings: Int
    public let image: URL
    public let imageType: ImageType
    public let summary: String
    public let dishTypes: [String]
    public let diets: [String]
    public let instructions: String
    public let analyzedInstructions: [AnalyzedInstruction]

    // MARK: Initialization

    public init(vegetarian: Bool,
                vegan: Bool,
                glutenFree: Bool,
                dairyFree: Bool,
                veryHealthy: Bool,
                cheap: Bool,
                veryPopular: Bool,
                extendedIngredients: [ExtendedIngredient],
                id: Int,
                title: String,
                readyInMinutes: Int,
                servings: Int,
                image: URL,
                imageType: ImageType,
                summary: String,
                dishTypes: [String],
                diets: [String],
                instructions: String,
                analyzedInstructions: [AnalyzedInstruction]) {

        self.vegetarian = vegetarian
        self.vegan = vegan
        self.glutenFree = glutenFree
        self.dairyFree = dairyFree
        self.veryHealthy = veryHealthy
        self.cheap = cheap
        self.veryPopular = veryPopular
        self.extendedIngredients = extendedIngredients
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.image = image
        self.imageType = imageType
        self.summary = summary
        self.dishTypes = dishTypes
        self.diets = diets
        self.instructions = instructions
        self.analyzedInstructions = analyzedInstructions
    }
}

extension RecipesInformationDTO {

    // MARK: - ImageType

    public enum ImageType: String, Decodable {
        case jpg = "jpg"
        case png = "png"
    }

    // MARK: - AnalyzedInstruction

    public struct AnalyzedInstruction: Decodable {

        // MARK: Public Properties

        public let name: String
        public let steps: [Step]

        // MARK: Initialization

        public init(name: String, steps: [Step]) {
            self.name = name
            self.steps = steps
        }
    }

    // MARK: - ExtendedIngredient

    public struct ExtendedIngredient: Decodable {

        // MARK: Public Properties

        public let id: Int
        public let image: String?
        public let consistency: String
        public let original: String
        public let amount: Double
        public let unit: String

        // MARK: Initialization

        public init(id: Int, image: String?, consistency: String, original: String, amount: Double, unit: String) {
            self.id = id
            self.image = image
            self.consistency = consistency
            self.original = original
            self.amount = amount
            self.unit = unit
        }
    }
}

extension RecipesInformationDTO.AnalyzedInstruction {

    // MARK: - Step

    public struct Step: Decodable {

        // MARK: Public Properties

        public let number: Int
        public let step: String
        public let ingredients: [StepItem]
        public let equipment: [StepItem]

        // MARK: Initialization

        public init(number: Int, step: String, ingredients: [StepItem], equipment: [StepItem]) {
            self.number = number
            self.step = step
            self.ingredients = ingredients
            self.equipment = equipment
        }
    }
}

extension RecipesInformationDTO.AnalyzedInstruction.Step {

    // MARK: - StepItem

    public struct StepItem: Decodable {

        // MARK: Public Properties

        public let id: Int
        public let name: String
        public let localizedName: String
        public let image: String

        // MARK: Initialization

        public init(id: Int, name: String, localizedName: String, image: String) {
            self.id = id
            self.name = name
            self.localizedName = localizedName
            self.image = image
        }
    }
}
