import Foundation
import Spoonacular

final class MockNetworkingProvider: NetworkingProvider, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case sendRequest
        case sendRequestWithResponseModel
    }

    // MARK: - Internal Properties

    var receivedEndpoint: RequestType?

    // MARK: - Internal Methods

    func sendRequest(endpoint: RequestType) async throws {
        append(.sendRequest)

        receivedEndpoint = endpoint

        if let error: Error = getStubOptionalValue(for: .sendRequest) {
            throw error
        }
    }

    func sendRequest<T>(endpoint: RequestType, responseModel: T.Type) async throws -> T where T: Decodable {
        append(.sendRequestWithResponseModel)

        receivedEndpoint = endpoint

        if let error: Error = getStubOptionalValue(for: .sendRequestWithResponseModel) {
            throw error
        }

        return getStubValue(for: .sendRequestWithResponseModel)
    }
}
