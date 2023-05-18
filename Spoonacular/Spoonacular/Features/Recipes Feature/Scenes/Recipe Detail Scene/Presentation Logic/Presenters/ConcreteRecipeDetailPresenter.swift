import Foundation

final class ConcreteRecipeDetailPresenter: RecipeDetailInteractorOutput {

    // MARK: - Internal Properties

    weak var view: RecipeDetailPresenterOutput?

    // MARK: - Internal Methods

    func markedAsFavorite() async {
        await view?.configure(state: .failure(title: "Confirmation", message: "Recipe saved to your favorites"))
    }

    func fetchedRecipeDetail(detail: RecipeInformationModel) async {
        await view?.configure(state: .content(recipe: detail))
    }

    func noInternetConnection() async {
        await view?.configure(state: .failure(title: "Uups!", message: "Maybe you don't have internet connection"))
    }

    func loading() async {
        await view?.configure(state: .loading)
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
