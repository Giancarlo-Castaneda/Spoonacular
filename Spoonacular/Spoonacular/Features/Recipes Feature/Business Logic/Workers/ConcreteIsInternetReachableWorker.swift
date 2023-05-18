import Foundation
import Reachability

final class ConcreteIsInternetReachableWorker: IsInternetReachableWorker {

    // MARK: - Internal Methods

    func execute() throws -> Bool {
        let reachability = try Reachability()

        return reachability.connection != .unavailable
    }
}
