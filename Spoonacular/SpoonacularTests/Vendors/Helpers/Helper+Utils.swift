import Foundation

extension Helper {

    static func makeError(domain: String = "", code: Int = 0, localizedDescription: String = "") -> NSError {
        .init(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }

    static func makeJSONDecoder(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                                dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601) -> JSONDecoder {

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
        jsonDecoder.dateDecodingStrategy = dateDecodingStrategy

        return jsonDecoder
    }
}
