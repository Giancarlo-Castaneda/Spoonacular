import Foundation

public protocol Stubbable: AnyObject {

    associatedtype Invocation: Hashable

    static func getStubOptionalValue<U>(for invocation: Invocation) -> U?
    static func getStubValue<U>(for invocation: Invocation) -> U
    static func setStubValue(_ value: Any?, for invocation: Invocation)

    func getStubOptionalValue<U>(for invocation: Invocation) -> U?
    func getStubValue<U>(for invocation: Invocation) -> U
    func setStubValue(_ value: Any?, for invocation: Invocation)
}

public extension Stubbable {

    // MARK: - Public Static Methods

    static func getStubOptionalValue<U>(for invocation: Invocation) -> U? {
        let stubs = objc_getAssociatedObject(self, &AssociatedKeys.stubs) as? [Invocation: Any?] ?? [:]

        return stubs[invocation] as? U
    }

    static func getStubValue<U>(for invocation: Invocation) -> U {
        getStubOptionalValue(for: invocation)!
    }

    static func setStubValue(_ value: Any?, for invocation: Invocation) {
        var stubs = objc_getAssociatedObject(self, &AssociatedKeys.stubs) as? [Invocation: Any?] ?? [:]
        stubs[invocation] = value

        objc_setAssociatedObject(self, &AssociatedKeys.stubs, stubs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    // MARK: - Public Methods

    func getStubOptionalValue<U>(for invocation: Invocation) -> U? {
        let stubs = objc_getAssociatedObject(self, &AssociatedKeys.stubs) as? [Invocation: Any?] ?? [:]

        return stubs[invocation] as? U
    }

    func getStubValue<U>(for invocation: Invocation) -> U {
        getStubOptionalValue(for: invocation)!
    }

    func setStubValue(_ value: Any?, for invocation: Invocation) {
        var stubs = objc_getAssociatedObject(self, &AssociatedKeys.stubs) as? [Invocation: Any?] ?? [:]
        stubs[invocation] = value

        objc_setAssociatedObject(self, &AssociatedKeys.stubs, stubs, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
