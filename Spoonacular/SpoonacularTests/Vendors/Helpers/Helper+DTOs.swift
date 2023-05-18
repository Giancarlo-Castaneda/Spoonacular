import Foundation
import Spoonacular
import XCTest

extension Helper {

    static func makeRecipesComplexSearchDTOData() throws -> Data {
        let bundle = try XCTUnwrap(Bundle(identifier: "co.gian.Spoonacular"))

        return try XCTUnwrap(NSDataAsset(name: "Recipes_ComplexSearch_GET.json", bundle: bundle)).data
    }

    static func makeRecipesInformationDTOData() throws -> Data {
        let bundle = try XCTUnwrap(Bundle(identifier: "co.gian.Spoonacular"))

        return try XCTUnwrap(NSDataAsset(name: "Recipes_Information_GET.json", bundle: bundle)).data
    }

    static func makeRecipesComplexSearchDTO() throws -> RecipesComplexSearchDTO {
        let jsonDecoder = makeJSONDecoder()

        return try jsonDecoder.decode(RecipesComplexSearchDTO.self, from: makeRecipesComplexSearchDTOData())
    }

    static func makeRecipesInformationDTO() throws -> RecipesInformationDTO {
        let jsonDecoder = makeJSONDecoder()

        return try jsonDecoder.decode(RecipesInformationDTO.self, from: makeRecipesInformationDTOData())
    }
}
