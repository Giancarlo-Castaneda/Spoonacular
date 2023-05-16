import Foundation

extension SpoonacularAPI {

    static func recipesComplexSearchGET(query: String, recipesPerPage: Int, offset: Int) -> SpoonacularAPI {
        let parameters: [String: Any] = [
            "query": query,
            "number": recipesPerPage,
            "offset": offset
        ]

        return .init(path: "/recipes/complexSearch", method: .get, body: parameters)
    }
}
