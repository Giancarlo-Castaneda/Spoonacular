import UIKit

public extension LayoutDSL {

    enum VerticalAnchor {
        case top
        case bottom
        case safeTop
        case safeBottom
        case custom(NSLayoutYAxisAnchor)
    }
}

// MARK: - getAnchor

extension LayoutDSL.VerticalAnchor {

    func getAnchor(view: UIView) -> NSLayoutYAxisAnchor {
        switch self {
        case .top:
            return view.topAnchor

        case .bottom:
            return view.bottomAnchor

        case .safeTop:
            return view.safeAreaLayoutGuide.topAnchor

        case .safeBottom:
            return view.safeAreaLayoutGuide.bottomAnchor

        case let .custom(customAnchor):
            return customAnchor
        }
    }
}
