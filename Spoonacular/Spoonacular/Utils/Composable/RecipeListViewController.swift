import UIKit

final class RecipeListViewController: UIViewController {

    // MARK: - View Components

    private lazy var searchBar = UISearchController().with {
        $0.searchBar.placeholder = "Look for a recipe..."
        $0.searchBar.searchBarStyle = .minimal
        $0.searchResultsUpdater = self
    }

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).with {
        $0.backgroundColor = .clear
        $0.registerCell(UITableViewCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
    }

    // MARK: - Private Properties

    private var dataProvider: RecipeListDataProvider?
    private var query = ""
    private var pendingRequestWorkItem: DispatchWorkItem?
    private let routeService: RouteService

    // MARK: - Internal Properties

    var interactor: RecipeListInteractor?

    // MARK: - Initialization

    init(routeService: RouteService) {
        self.routeService = routeService

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
        interactor?.fetchRecipes(query: query)
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemPurple
        title = "Recipe List"
        navigationItem.searchController = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                            target: self,
                                                            action: #selector(showFavorites))

        view.addSubview(tableView)
    }

    @objc
    private func showFavorites() {
        let vc = FavoriteRecipesViewController(routeService: routeService)
        navigationController?.present(vc, animated: true)
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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let offSetY = self.tableView.contentOffset.y
        let contentHeight = self.tableView.contentSize.height

        if offSetY > (contentHeight - self.tableView.frame.size.height - 100) {
            interactor?.fetchRecipes(query: query)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let viewModel = dataProvider?.viewModel(at: indexPath)
        else { fatalError("Undefined view model for indexPath \(indexPath)") }

        routeService.navigate(to: RecipeDetailRoute(id: viewModel.id.description),
                              from: self,
                              presentationStyle: .currentContext)
    }
}

// MARK: - UISearchResultsUpdating

extension RecipeListViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }

        pendingRequestWorkItem?.cancel()

        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.query = query
            self?.interactor?.fetchRecipes(query: query)
        }

        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250),
                                      execute: requestWorkItem)
    }
}
