import UIKit

public enum AssetsColor: String {
    case green = "Green"
}

// MARK: - App Color

public extension AssetsColor {

    var appColor: UIColor {
        UIColor(named: self.rawValue) ?? .white
    }
}
