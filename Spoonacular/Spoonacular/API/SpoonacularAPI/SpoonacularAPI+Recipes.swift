import Foundation

extension SpoonacularAPI {

    static func recipesComplexSearchGET(query: String) -> SpoonacularAPI {
        let parameters: [String: Any] = [
            "query": query,
            "number": 20
        ]

        return .init(path: "/recipes/complexSearch", method: .get, body: parameters)
    }
}
