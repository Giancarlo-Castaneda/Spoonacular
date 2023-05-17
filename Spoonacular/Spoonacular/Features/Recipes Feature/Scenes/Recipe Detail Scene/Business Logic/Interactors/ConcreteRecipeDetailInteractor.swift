import Foundation

final class ConcreteRecipeDetailInteractor: RecipeDetailInteractor {

    // MARK: - Private Properties

    private let fetchRecipeDetailWorker: FetchRecipeDetailWorker

    // MARK: - Internal Properties

    var presenter: RecipeDetailInteractorOutput?

    // MARK: - Initialization

    init(fetchRecipeDetailWorker: FetchRecipeDetailWorker) {
        self.fetchRecipeDetailWorker = fetchRecipeDetailWorker
    }

    // MARK: - Internal Methods

    func fetchRecipeDetail(id: String) {
        Task {
            do {
                await presenter?.loading()

                let detail = try await fetchRecipeDetailWorker.execute(id: id)

                await presenter?.fetchedRecipeDetail(detail: detail)
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
