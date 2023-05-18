import Foundation

public protocol IsInternetReachableWorker {

    func execute() throws -> Bool
}
