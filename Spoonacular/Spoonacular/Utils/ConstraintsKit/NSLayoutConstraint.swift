import UIKit

public extension NSLayoutConstraint {

    @discardableResult
    func set(_ active: Bool) -> Self {
        isActive = active
        return self
    }

    @discardableResult
    func activate() -> Self {
        self.set(true)
    }

    @discardableResult
    func deactivate() -> Self {
        self.set(false)
    }
}
