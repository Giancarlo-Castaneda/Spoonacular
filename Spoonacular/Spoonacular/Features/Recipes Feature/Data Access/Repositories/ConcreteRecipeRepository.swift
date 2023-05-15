import Foundation

final class ConcreteRecipeRepository: RecipeRepository {

    // MARK: - Private Properties

    private let networkingProvider: NetworkingProvider

    // MARK: - Initialization

    init(networkingProvider: NetworkingProvider) {
        self.networkingProvider = networkingProvider
    }

    // MARK: - Internal Methods

    func fetchRecipeList(query: String) async throws -> RecipeListModel {
        let endpoint = SpoonacularAPI.recipesComplexSearchGET(query: query)
        let dto = try await networkingProvider.sendRequest(endpoint: endpoint,
                                                           responseModel: RecipesComplexSearchDTO.self)

        return RecipeListModel(dto)
    }
}
