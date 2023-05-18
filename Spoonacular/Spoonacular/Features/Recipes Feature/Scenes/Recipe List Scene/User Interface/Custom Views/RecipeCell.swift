import Nuke
import NukeExtensions
import UIKit

final class RecipeCell: UITableViewCell {

    // MARK: - View Components

    private lazy var titleLabel = UILabel().with {
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }

    private lazy var recipeImage = UIImageView().with {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = LayoutConstant.imageCornerRadius
        $0.clipsToBounds = true
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(recipeImage)
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        recipeImage.layout.fillSuperviewVertically(offset: LayoutConstant.imageSpacing)
        recipeImage.layout.leftAnchor(to: self, offset: LayoutConstant.imageSpacing)
        recipeImage.layout.aspectRatio(LayoutConstant.aspectRatio, dimension: .height)
        titleLabel.layout.leftAnchor(to: recipeImage, horizontal: .right, offset: LayoutConstant.labelSpacing)
        titleLabel.layout.trailingAnchor(to: self, offset: LayoutConstant.labelSpacing)
        titleLabel.layout.topAnchor(to: self, offset: LayoutConstant.labelSpacing)
        titleLabel.layout.bottomAnchor(to: self, offset: LayoutConstant.labelSpacing)
    }

    private func loadImage(url: URL, imageView: UIImageView) {
        let request = ImageRequest(url: url)

        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.5))
        options.contentModes = .init(success: .scaleAspectFill,
                                     failure: .scaleAspectFill,
                                     placeholder: .scaleAspectFit)

        NukeExtensions.loadImage(with: request, options: options, into: imageView)
    }

    // MARK: - Internal Methods

    func configure(image: URL, title: String) {
        loadImage(url: image, imageView: recipeImage)
        titleLabel.text = title
    }
}
