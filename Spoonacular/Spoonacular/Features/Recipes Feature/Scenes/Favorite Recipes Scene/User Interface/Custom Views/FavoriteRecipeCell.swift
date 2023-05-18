import Nuke
import NukeExtensions
import UIKit

final class FavoriteRecipeCell: UITableViewCell {

    // MARK: - View Components

    private lazy var titleLabel = UILabel().with {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }

    private lazy var subtitleLabel = UILabel().with {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.numberOfLines = 1
    }

    private lazy var recipeImage = UIImageView().with {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }

    private lazy var gradientLayer = CAGradientLayer()

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
        addSubview(subtitleLabel)
    }

    private func setupConstraints() {
        recipeImage.layout.fillSuperview()
        recipeImage.layout.heightAnchor(LayoutConstant.imageHeight)

        titleLabel.layout.leadingAnchor(to: self, offset: LayoutConstant.labelSpacing)
        titleLabel.layout.bottomAnchor(to: self, offset: LayoutConstant.labelSpacing)
        subtitleLabel.layout.leadingAnchor(to: titleLabel, horizontal: .trailing, offset: LayoutConstant.labelSpacing)
        subtitleLabel.layout.trailingAnchor(to: self, offset: LayoutConstant.labelSpacing)
        subtitleLabel.layout.bottomAnchor(to: self, offset: LayoutConstant.labelSpacing)
        subtitleLabel.layout.widthAnchor(LayoutConstant.labelWidth)
    }

    private func loadImage(url: URL, imageView: UIImageView) {
        let request = ImageRequest(url: url)

        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.5))
        options.contentModes = .init(success: .scaleAspectFill,
                                     failure: .scaleAspectFill,
                                     placeholder: .scaleAspectFit)

        NukeExtensions.loadImage(with: request, options: options, into: imageView)
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)

        gradientLayer.frame = recipeImage.bounds
    }

    // MARK: - Internal Methods

    func configure(image: URL, title: String, subtitle: String) {
        loadImage(url: image, imageView: recipeImage)
        titleLabel.text = title
        subtitleLabel.text = subtitle

        let colorSet = [UIColor.clear,
                        UIColor.black.withAlphaComponent(0.8)]
        let location = [0.2, 1.0]
        recipeImage.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
}
