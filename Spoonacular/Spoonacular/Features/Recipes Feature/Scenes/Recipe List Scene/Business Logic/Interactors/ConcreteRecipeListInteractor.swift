import Foundation

final class ConcreteRecipeListInteractor: RecipeListInteractor {

    // MARK: - Private Properties

    private let fetchRecipeListWorker: FetchRecipeListWorker
    private let isInternetReachableWorker: IsInternetReachableWorker
    private let recipesPerPage = 20
    private var showedItems: [RecipeModel] = []
    private var offset = 0
    private var total = 0
    private var previousQuery = ""
    private var isPaginationRequestStillResume = false

    // MARK: - Internal Properties

    var presenter: RecipeListInteractorOutput?

    // MARK: - Initialization

    init(fetchRecipeListWorker: FetchRecipeListWorker, isInternetReachableWorker: IsInternetReachableWorker) {
        self.fetchRecipeListWorker = fetchRecipeListWorker
        self.isInternetReachableWorker = isInternetReachableWorker
    }

    // MARK: - Internal Methods

    func fetchRecipes(query: String) {
        Task {
            do {
                guard
                    try isInternetReachableWorker.execute()
                else {
                    await presenter?.noInternetConnection()
                    return
                }

                guard
                    !isPaginationRequestStillResume
                else { return }

                if previousQuery != query {
                    offset = 0
                    total = 0
                    showedItems.removeAll()
                }
                previousQuery = query

                guard
                    (offset == 0 && total == 0) || offset < total
                else {
                    isPaginationRequestStillResume = false
                    return
                }

                isPaginationRequestStillResume = true

                await presenter?.loading()

                let recipeList = try await fetchRecipeListWorker.execute(query: query,
                                                                          recipesPerPage: recipesPerPage,
                                                                          offset: offset)

                showedItems.append(contentsOf: recipeList.recipes)
                total = recipeList.totalResults
                offset = showedItems.count

                await presenter?.fetchedRecipes(recipes: showedItems)
                isPaginationRequestStillResume = false
            } catch {
                await presenter?.error(error)
            }
        }
    }
}
