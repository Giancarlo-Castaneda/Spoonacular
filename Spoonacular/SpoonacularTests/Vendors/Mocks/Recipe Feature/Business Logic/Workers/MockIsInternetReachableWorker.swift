import Foundation
import Spoonacular

final class MockIsInternetReachableWorker: IsInternetReachableWorker, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case execute
    }

    // MARK: - Internal Methods

    func execute() throws -> Bool {
        append(.execute)

        if let error: Error = getStubOptionalValue(for: .execute) {
            throw error
        }

        return getStubValue(for: .execute)
    }
}
