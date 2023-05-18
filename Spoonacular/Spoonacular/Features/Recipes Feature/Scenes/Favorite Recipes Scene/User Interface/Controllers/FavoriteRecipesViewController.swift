import UIKit

final class FavoriteRecipesViewController: UIViewController {

    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).with {
        $0.backgroundColor = .clear
        $0.registerCell(UITableViewCell.self)
        $0.dataSource = self
        $0.delegate = self
        $0.showsVerticalScrollIndicator = false
    }

    private let routeService: RouteService
    private var favoriteRecipes: [RecipeInformationModel] = []
    private let repo = ConcreteFavoriteRecipesRepository()

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

        favoriteRecipes = repo.fetchFavorites()
        tableView.reloadData()

        if favoriteRecipes.isEmpty {
            let label = UILabel()
            label.text = "No tienes recetas favoritas"
            tableView.backgroundView = label
        } else {
            let label = UILabel()
            label.text = favoriteRecipes.count.description
            tableView.backgroundView = label
        }
    }

    private func setupUI() {
        view.backgroundColor = .systemPurple
        title = "Favorite Recipes"

        view.addSubview(tableView)
    }

    private func setupContraints() {
        tableView.layout.fillSuperview()
    }
}

// MARK: - UITableViewDataSource

extension FavoriteRecipesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteRecipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = favoriteRecipes[indexPath.row]

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
}
