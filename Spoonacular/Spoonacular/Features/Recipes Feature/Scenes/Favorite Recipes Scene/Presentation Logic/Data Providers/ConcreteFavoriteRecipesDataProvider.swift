import Foundation

final class ConcreteFavoriteRecipesDataProvider: FavoriteRecipesDataProvider {

    // MARK: - Private Properties

    private lazy var sections = generateSections()
    private var favoriteRecipes: [RecipeInformationModel]

    // MARK: - Initialization

    init(favoriteRecipes: [RecipeInformationModel]) {
        self.favoriteRecipes = favoriteRecipes
    }

    // MARK: - Private Methods

    private func generateSections() -> [FavoriteRecipeViewModel] {
        favoriteRecipes.map {
            ConcreteFavoriteRecipeViewModel(id: $0.id,
                                            title: $0.title,
                                            image: ($0.image ?? URL(string: "foo.com")!),
                                            preparationTime: $0.readyInMinutes)
        }
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

    func viewModel(at indexPath: IndexPath) -> FavoriteRecipeViewModel? {
        guard
            (0..<numberOfSections()) ~= indexPath.section,
            (0..<numberOfRows(inSection: indexPath.section)) ~= indexPath.row
        else { return nil }

        return sections[indexPath.section]
    }
}
