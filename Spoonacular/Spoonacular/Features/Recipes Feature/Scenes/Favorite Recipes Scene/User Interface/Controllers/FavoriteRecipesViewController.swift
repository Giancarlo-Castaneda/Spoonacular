import UIKit

final class FavoriteRecipesViewController: UIViewController {

    // MARK: - View Components

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).with {
        $0.backgroundColor = .clear
        $0.registerCell(UITableViewCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
    }

    // MARK: - Private Properties

    private var dataProvider: FavoriteRecipesDataProvider?

    // MARK: - Internal Properties

    var interactor: FavoriteRecipesInteractor?

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
        interactor?.fetchFavoriteRecipes()
    }

    // MARK: - Private Properties

    private func setupUI() {
        view.backgroundColor = .systemGray6
        title = "Favorite Recipes"

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

    private func showEmptyView() {
        let label = UILabel()
        label.text = "Choose your favorite recipes.\nTo find them here."
        label.numberOfLines = 2
        label.textAlignment = .center
        tableView.backgroundView = label
    }

    private func resetView() {
        tableView.backgroundView = nil
    }

    private func showLoading() {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.tintColor = view.tintColor
        indicator.startAnimating()
        tableView.backgroundView = indicator
    }
}

// MARK: - FavoriteRecipesPresenterOutput

extension FavoriteRecipesViewController: FavoriteRecipesPresenterOutput {

    func configure(state: FavoriteRecipesViewState) {
        resetView()

        switch state {
        case let .content(dataProvider):
            self.dataProvider = dataProvider
            tableView.reloadData()

        case let .failure(title, message):
            showEmptyView()
            showAlert(title: title, message: message)

        case .loading:
            showLoading()
        }
    }
}

// MARK: - UITableViewDataSource

extension FavoriteRecipesViewController: UITableViewDataSource {

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

extension FavoriteRecipesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
