import Foundation

final class ConcreteRecipeListDataProvider: RecipeListDataProvider {

    // MARK: - Private Properties

    private lazy var sections = generateSections()
    private let recipes: [RecipeModel]
    private let viewModelFactory: RecipeViewModelFactory

    // MARK: - Initialization

    init(recipes: [RecipeModel], viewModelFactory: RecipeViewModelFactory) {
        self.recipes = recipes
        self.viewModelFactory = viewModelFactory
    }

    // MARK: - Private Methods

    private func generateSections() -> [RecipeViewModel] {
        recipes.map { viewModelFactory.makeRecipeViewModel(id: $0.id,title: $0.title, image: $0.image) }
    }

    // MARK: - Internal Methods

    func numberOfSections() -> Int {
        sections.count
    }

    func numberOfRows(inSection section: Int) -> Int {
        guard
            (0..<numberOfSections()) ~= section
        else { return 0 }

        return 1
    }

    func viewModel(at indexPath: IndexPath) -> RecipeViewModel? {
        guard
            (0..<numberOfSections()) ~= indexPath.section,
            (0..<numberOfRows(inSection: indexPath.section)) ~= indexPath.row
        else { return nil }

        return sections[indexPath.section]
    }
}
