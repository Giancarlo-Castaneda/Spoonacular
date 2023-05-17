import Foundation

public protocol Invocable: AnyObject {

    associatedtype Invocation: Equatable

    static func append(_ invocation: Invocation)
    static func cleanInvocations()
    static func verify(_ expectedInvocations: [Invocation]) -> Bool

    func append(_ invocation: Invocation)
    func cleanInvocations()
    func verify(_ expected: [Invocation]) -> Bool
}

public extension Invocable {

    // MARK: - Public Static Methods

    static func append(_ invocation: Invocation) {
        var invocations = objc_getAssociatedObject(self, &AssociatedKeys.invocations) as? [Invocation] ?? []
        invocations.append(invocation)

        objc_setAssociatedObject(self, &AssociatedKeys.invocations, invocations, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    static func cleanInvocations() {
        objc_setAssociatedObject(self, &AssociatedKeys.invocations, [], .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    static func verify(_ expectedInvocations: [Invocation]) -> Bool {
        let invocations = objc_getAssociatedObject(self, &AssociatedKeys.invocations) as? [Invocation]

        return expectedInvocations == invocations
    }

    // MARK: - Public Methods

    func append(_ invocation: Invocation) {
        var invocations = objc_getAssociatedObject(self, &AssociatedKeys.invocations) as? [Invocation] ?? []
        invocations.append(invocation)

        objc_setAssociatedObject(self, &AssociatedKeys.invocations, invocations, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func cleanInvocations() {
        objc_setAssociatedObject(self, &AssociatedKeys.invocations, [], .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func verify(_ expectedInvocations: [Invocation]) -> Bool {
        let invocations = objc_getAssociatedObject(self, &AssociatedKeys.invocations) as? [Invocation]

        return expectedInvocations == invocations
    }
}
