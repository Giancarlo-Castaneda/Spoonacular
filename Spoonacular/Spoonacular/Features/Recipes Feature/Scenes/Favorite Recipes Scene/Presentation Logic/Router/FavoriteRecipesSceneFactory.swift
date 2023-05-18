import UIKit

final class FavoriteRecipesSceneFactory {

    // MARK: - Private Properties

    private let repository: FavoriteRecipesRepository

    // MARK: - Initialization

    init(repository: FavoriteRecipesRepository) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func build() -> UIViewController {
        let fetchFavoriteWorker = ConcreteFetchFavoriteRecipesWorker(repository: repository)
        let deleteFavoriteWorker = ConcreteDeleteFavoriteRecipeWorker(repository: repository)
        let interactor = ConcreteFavoriteRecipesInteractor(fetchFavoriteWorker: fetchFavoriteWorker,
                                                           deleteFavoriteWorker: deleteFavoriteWorker)
        let presenter = ConcreteFavoriteRecipesPresenter()
        let viewController = FavoriteRecipesViewController()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
