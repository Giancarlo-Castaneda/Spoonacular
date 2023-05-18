import Foundation

extension SpoonacularAPI {

    static func recipesComplexSearchGET(query: String, recipesPerPage: Int, offset: Int) -> SpoonacularAPI {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "number", value: recipesPerPage.description),
            URLQueryItem(name: "offset", value: offset.description)
        ]

        return .init(path: "/recipes/complexSearch", method: .get, body: nil, queryItems: queryItems)
    }

    static func recipesInformationGET(id: String) -> SpoonacularAPI {
        .init(path: "/recipes/\(id)/information", method: .get, body: nil, queryItems: nil)
    }
}
