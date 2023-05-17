import UIKit

final class RecipeDetailViewController: UIViewController {

    // MARK: - Private Properties

    private let recipeId: String

    // MARK: - Internal Properties

    var interactor: RecipeDetailInteractor?

    // MARK: - Initialization

    init(recipeId: String) {
        self.recipeId = recipeId

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupContraints()
        interactor?.fetchRecipeDetail(id: recipeId)
    }

    // MARK: - Private Methods

    private func setupUI() { }

    private func setupContraints() { }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(okAction)
        alert.view.tintColor = view.tintColor

        present(alert, animated: true)
    }
}

// MARK: - RecipeDetailPresenterOutput

extension RecipeDetailViewController: RecipeDetailPresenterOutput {

    func configure(state: RecipeDetailViewState) {
        switch state {
        case .content:
            break

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case .loading:
            break
        }
    }
}
