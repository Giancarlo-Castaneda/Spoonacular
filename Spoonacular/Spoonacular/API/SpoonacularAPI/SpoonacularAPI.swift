import Foundation

struct SpoonacularAPI: RequestType {

    // MARK: - Internal Properties

    let path: String
    let method: HTTPMethod
    let body: [String : Any]?
    var queryItems: [URLQueryItem]?

    // MARK: - Initialization

    init(path: String, method: HTTPMethod, body: [String : Any]?, queryItems: [URLQueryItem]?) {
        self.path = path
        self.method = method
        self.body = body
        self.queryItems = queryItems
        addApiKey()
    }

    // MARK: - Private Methods

    mutating private func addApiKey() {
        if queryItems == nil { queryItems = [] }
        queryItems?.append(URLQueryItem(name: "apiKey", value: "d612a30d4ab847bba45509dd28e49950"))
    }
}
