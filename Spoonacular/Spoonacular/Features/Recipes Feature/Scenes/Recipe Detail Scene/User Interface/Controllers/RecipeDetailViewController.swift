import UIKit

final class RecipeDetailViewController: UIViewController {

    // MARK: - View Components

    private lazy var imageView = UIImageView().with {
        $0.backgroundColor = .red
    }
    private lazy var nameLabel = UILabel().with {
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    private lazy var instructionsLabel = UILabel().with {
        $0.numberOfLines = 0
    }

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

    private func setupUI() {
        view.backgroundColor = .systemPurple

        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(instructionsLabel)
    }

    private func setupContraints() {
        imageView.layout.topAnchor(to: view, vertical: .safeTop)
        imageView.layout.fillSuperviewHorizontally(offset: 16)
        imageView.layout.aspectRatio(0.7, dimension: .height)
        nameLabel.layout.heightAnchor(50)
        nameLabel.layout.topAnchor(to: imageView, vertical: .bottom, offset: 16)
        nameLabel.layout.fillSuperviewHorizontally(offset: 16)
        instructionsLabel.layout.topAnchor(to: nameLabel, vertical: .bottom, offset: 16)
        instructionsLabel.layout.fillSuperviewHorizontally(offset: 16)
        instructionsLabel.layout.bottomAnchor(to: view, vertical: .safeBottom, offset: 16)
    }

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
        case let .content(recipe):
            nameLabel.text = recipe.title
            instructionsLabel.text = recipe.instructions

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case .loading:
            break
        }
    }
}
