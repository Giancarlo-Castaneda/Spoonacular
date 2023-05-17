import Foundation

final class ConcreteRecipeDetailPresenter: RecipeDetailInteractorOutput {

    // MARK: - Internal Properties

    weak var view: RecipeDetailPresenterOutput?

    // MARK: - Internal Methods

    func fetchedRecipeDetail(detail: RecipeInformationModel) async {
        await view?.configure(state: .content)
    }

    func loading() async {
        await view?.configure(state: .loading)
    }

    func error(_ error: Error) async {
        await view?.configure(state: .failure(title: "Error", message: error.localizedDescription))
    }
}
