import UIKit

final class RecipeListViewController: UIViewController {

    // MARK: - View Components

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).with {
        $0.backgroundColor = .clear
        $0.registerCell(UITableViewCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
    }

    // MARK: - Private Properties

    private var dataProvider: RecipeListDataProvider?

    // MARK: - Internal Properties

    var interactor: RecipeListInteractor?

    // MARK: - Initialization

    init() {
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
        interactor?.fetchRecipes(query: "")
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemPurple
        title = "Recipe List"

        view.addSubview(tableView)
    }

    private func setupContraints() {
        tableView.layout.fillSuperview()
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(okAction)
        alert.view.tintColor = view.tintColor

        present(alert, animated: true)
    }
}

// MARK: - RecipesListPresenterOutput

extension RecipeListViewController: RecipesListPresenterOutput {

    func configure(state: RecipeListViewState) {
        switch state {
        case let .content(dataProvider):
            self.dataProvider = dataProvider
            tableView.reloadData()

        case let .failure(title, message):
            showAlert(title: title, message: message)

        case .loading:
            break
        }
    }
}

// MARK: - UITableViewDataSource

extension RecipeListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        dataProvider?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataProvider?.numberOfRows(inSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = dataProvider?.viewModel(at: indexPath)
        else { fatalError("Undefined view model for indexPath \(indexPath)") }

        let cell = tableView.dequeueCell(UITableViewCell.self, for: indexPath)

        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = viewModel.title
        contentConfiguration.textProperties.color = .systemMint

        cell.contentConfiguration = contentConfiguration

        return cell
    }
}

// MARK: - UITableViewDelegate

extension RecipeListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
