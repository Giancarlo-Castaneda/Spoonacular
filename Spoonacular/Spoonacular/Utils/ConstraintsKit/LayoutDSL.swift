import UIKit

public struct LayoutDSL {

    // MARK: - Private Properties

    private var view: UIView

    // MARK: - Initialization

    init(_ view: UIView) {
        self.view = view

        prepareForLayout()
    }

    // MARK: - Private Methods

    private func prepareForLayout() {
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Public Methods

    @discardableResult
    public func widthAnchor(_ width: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        switch relation {
        case .lessThanOrEqual:
            return view.widthAnchor.constraint(lessThanOrEqualToConstant: width).activate()

        case .equal:
            return view.widthAnchor.constraint(equalToConstant: width).activate()

        case .greaterThanOrEqual:
            return view.widthAnchor.constraint(greaterThanOrEqualToConstant: width).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func heightAnchor(_ height: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        switch relation {
        case .lessThanOrEqual:
            return view.heightAnchor.constraint(lessThanOrEqualToConstant: height).activate()

        case .equal:
            return view.heightAnchor.constraint(equalToConstant: height).activate()

        case .greaterThanOrEqual:
            return view.heightAnchor.constraint(greaterThanOrEqualToConstant: height).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func widthAnchor(to view: UIView,
                            dimension: DimensionAnchor = .width,
                            multiplier: CGFloat = 1,
                            relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let dimensionAnchor: NSLayoutDimension = dimension == .width ? view.widthAnchor : view.heightAnchor
        switch relation {
        case .lessThanOrEqual:
            return view.widthAnchor.constraint(lessThanOrEqualTo: dimensionAnchor, multiplier: multiplier)

        case .equal:
            return view.widthAnchor.constraint(equalTo: dimensionAnchor, multiplier: multiplier)

        case .greaterThanOrEqual:
            return view.widthAnchor.constraint(greaterThanOrEqualTo: dimensionAnchor, multiplier: multiplier)

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func heightAnchor(to view: UIView,
                             dimension: DimensionAnchor = .height,
                             multiplier: CGFloat = 1,
                             relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let dimensionAnchor: NSLayoutDimension = dimension == .height ? view.heightAnchor : view.widthAnchor
        switch relation {
        case .lessThanOrEqual:
            return view.heightAnchor.constraint(lessThanOrEqualTo: dimensionAnchor, multiplier: multiplier).activate()

        case .equal:
            return view.heightAnchor.constraint(equalTo: dimensionAnchor, multiplier: multiplier).activate()

        case .greaterThanOrEqual:
            return view.heightAnchor.constraint(greaterThanOrEqualTo: dimensionAnchor, multiplier: multiplier)
                .activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func aspectRatio(_ ratio: CGFloat,
                            dimension: DimensionAnchor,
                            relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        switch dimension {
        case .width:
            return widthAnchor(to: view, dimension: .height, multiplier: ratio)

        case .height:
            return heightAnchor(to: view, dimension: .width, multiplier: ratio)
        }
    }

    @discardableResult
    public func leftAnchor(to view: UIView,
                           horizontal: AbsoluteHorizontalAnchor = .left,
                           offset: CGFloat = 0,
                           relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let sideAnchor: NSLayoutXAxisAnchor = horizontal == .left ? view.leftAnchor : view.rightAnchor
        switch relation {
        case .lessThanOrEqual:
            return self.view.leftAnchor.constraint(lessThanOrEqualTo: sideAnchor, constant: offset).activate()

        case .equal:
            return self.view.leftAnchor.constraint(equalTo: sideAnchor, constant: offset).activate()

        case .greaterThanOrEqual:
            return self.view.leftAnchor.constraint(greaterThanOrEqualTo: sideAnchor, constant: offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func rightAnchor(to view: UIView,
                            horizontal: AbsoluteHorizontalAnchor = .right,
                            offset: CGFloat = 0,
                            relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let sideAnchor: NSLayoutXAxisAnchor = horizontal == .left ? view.leftAnchor : view.rightAnchor
        switch relation {
        case .lessThanOrEqual:
            return self.view.rightAnchor.constraint(lessThanOrEqualTo: sideAnchor, constant: -offset).activate()

        case .equal:
            return self.view.rightAnchor.constraint(equalTo: sideAnchor, constant: -offset).activate()

        case .greaterThanOrEqual:
            return self.view.rightAnchor.constraint(greaterThanOrEqualTo: sideAnchor, constant: -offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func leadingAnchor(to view: UIView,
                              horizontal: HorizontalAnchor = .leading,
                              offset: CGFloat = 0,
                              relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let sideAnchor: NSLayoutXAxisAnchor = horizontal == .leading ? view.leadingAnchor : view.trailingAnchor
        switch relation {
        case .lessThanOrEqual:
            return self.view.leadingAnchor.constraint(lessThanOrEqualTo: sideAnchor, constant: offset).activate()

        case .equal:
            return self.view.leadingAnchor.constraint(equalTo: sideAnchor, constant: offset).activate()

        case .greaterThanOrEqual:
            return self.view.leadingAnchor.constraint(greaterThanOrEqualTo: sideAnchor, constant: offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func trailingAnchor(to view: UIView,
                               horizontal: HorizontalAnchor = .trailing,
                               offset: CGFloat = 0,
                               relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let sideAnchor: NSLayoutXAxisAnchor = horizontal == .leading ? view.leadingAnchor : view.trailingAnchor
        switch relation {
        case .lessThanOrEqual:
            return self.view.trailingAnchor.constraint(lessThanOrEqualTo: sideAnchor, constant: -offset).activate()

        case .equal:
            return self.view.trailingAnchor.constraint(equalTo: sideAnchor, constant: -offset).activate()

        case .greaterThanOrEqual:
            return self.view.trailingAnchor.constraint(greaterThanOrEqualTo: sideAnchor, constant: -offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func topAnchor(to view: UIView,
                          vertical: VerticalAnchor = .top,
                          offset: CGFloat = 0,
                          relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let verticalAnchor = vertical.getAnchor(view: view)
        switch relation {
        case .lessThanOrEqual:
            return self.view.topAnchor.constraint(lessThanOrEqualTo: verticalAnchor, constant: offset).activate()

        case .equal:
            return self.view.topAnchor.constraint(equalTo: verticalAnchor, constant: offset).activate()

        case .greaterThanOrEqual:
            return self.view.topAnchor.constraint(greaterThanOrEqualTo: verticalAnchor, constant: offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func bottomAnchor(to view: UIView,
                             vertical: VerticalAnchor = .bottom,
                             offset: CGFloat = 0,
                             relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let verticalAnchor = vertical.getAnchor(view: view)
        switch relation {
        case .lessThanOrEqual:
            return self.view.bottomAnchor.constraint(lessThanOrEqualTo: verticalAnchor, constant: -offset).activate()

        case .equal:
            return self.view.bottomAnchor.constraint(equalTo: verticalAnchor, constant: -offset).activate()

        case .greaterThanOrEqual:
            return self.view.bottomAnchor.constraint(greaterThanOrEqualTo: verticalAnchor, constant: -offset).activate()

        @unknown default:
            fatalError("Unknwon value of NSLayoutConstraint.Relation triggered")
        }
    }

    @discardableResult
    public func centerXAnchor(to view: UIView, multiplier: CGFloat = 1, offset: CGFloat = 0) -> NSLayoutConstraint {
        NSLayoutConstraint(item: self.view,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: multiplier,
                           constant: offset).activate()
    }

    @discardableResult
    public func centerYAnchor(to view: UIView, multiplier: CGFloat = 1, offset: CGFloat = 0) -> NSLayoutConstraint {
        NSLayoutConstraint(item: self.view,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: multiplier,
                           constant: offset).activate()
    }

    @discardableResult
    public func centerSuperview(multiplier: CGFloat = 1, offset: CGFloat = 0) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        guard let superview = view.superview else { return constraints }
        constraints.append(centerXAnchor(to: superview, multiplier: multiplier, offset: offset))
        constraints.append(centerYAnchor(to: superview, multiplier: multiplier, offset: offset))
        return constraints
    }

    @discardableResult
    public func center(in view: UIView) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(centerXAnchor(to: view))
        constraints.append(centerYAnchor(to: view))
        return constraints
    }

    @discardableResult
    public func fillSuperviewHorizontally(offset: CGFloat = 0) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        guard let superview = view.superview else { return constraints }
        constraints.append(leadingAnchor(to: superview, offset: offset))
        constraints.append(trailingAnchor(to: superview, offset: offset))
        return constraints
    }

    @discardableResult
    public func fillSuperviewVertically(offset: CGFloat = 0) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        guard let superview = view.superview else { return constraints }
        constraints.append(topAnchor(to: superview, offset: offset))
        constraints.append(bottomAnchor(to: superview, offset: offset))
        return constraints
    }

    @discardableResult
    public func fillSuperview(verticalOffset: CGFloat = 0, horizontalOffset: CGFloat = 0) -> [NSLayoutConstraint] {
        fillSuperviewVertically(offset: verticalOffset) + fillSuperviewHorizontally(offset: horizontalOffset)
    }

    @discardableResult
    public func fillSuperview(offset: CGFloat = 0) -> [NSLayoutConstraint] {
        fillSuperview(verticalOffset: offset, horizontalOffset: offset)
    }
}
