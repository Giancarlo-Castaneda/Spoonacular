import Foundation

public protocol Composable { }

public extension Composable {

    @discardableResult
    func with(_ callback: (Self) -> Void) -> Self {
        callback(self)

        return self
    }
}

// MARK: - Composable

extension NSObject: Composable { }
