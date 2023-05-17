import Foundation

public protocol Reusable: AnyObject { }

// MARK: - Extension

public extension Reusable {

    // MARK: - Public Static Properties

    static var reuseIdentifier: String { String(describing: self) }
}
