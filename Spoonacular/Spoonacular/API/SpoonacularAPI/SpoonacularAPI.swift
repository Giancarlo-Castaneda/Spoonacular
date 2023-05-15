import Foundation

struct SpoonacularAPI: RequestType {

    // MARK: - Internal Properties

    let path: String
    let method: HTTPMethod
    let body: [String : Any]?

    // MARK: - Initialization

    init(path: String, method: HTTPMethod, body: [String : Any]?) {
        self.path = path
        self.method = method
        self.body = body
    }
}
