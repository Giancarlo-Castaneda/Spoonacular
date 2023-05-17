import Foundation

final class ConcreteRecipesDataProviderFactory: RecipesDataProviderFactory {

    // MARK: - Private Properties

    private let viewModelFactory: RecipeViewModelFactory

    // MARK: - Initialization

    init(viewModelFactory: RecipeViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }

    // MARK: - Internal Methods

    func makeRecipeListDataProvider(recipes: [RecipeModel]) -> RecipeListDataProvider {
        ConcreteRecipeListDataProvider(recipes: recipes, viewModelFactory: viewModelFactory)
    }
}
