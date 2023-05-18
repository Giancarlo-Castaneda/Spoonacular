import Foundation

public struct RecipesComplexSearchDTO: Decodable {

    // MARK: - Public Properties

    public let results: [Result]
    public let offset: Int
    public let number: Int
    public let totalResults: Int

    // MARK: - Initialization

    public init(results: [Result], offset: Int, number: Int, totalResults: Int) {
        self.results = results
        self.offset = offset
        self.number = number
        self.totalResults = totalResults
    }
}

extension RecipesComplexSearchDTO {

    public struct Result: Decodable {

        // MARK: - Public Properties

        public let id: Int
        public let title: String
        public let image: URL
        public let imageType: ImageType

        // MARK: - Initialization

        public init(id: Int, title: String, image: URL, imageType: ImageType) {
            self.id = id
            self.title = title
            self.image = image
            self.imageType = imageType
        }
    }
}

extension RecipesComplexSearchDTO.Result {

    public enum ImageType: String, Decodable {
        case jpg = "jpg"
        case png = "png"
    }
}
