import XCTest

@testable import Spoonacular

final class RecipesComplexSearchDTOTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipesComplexSearchDTO

    // MARK: Private Properties

    private var sut: SUT!
    private var jsonDecoder: JSONDecoder!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        jsonDecoder = Helper.makeJSONDecoder()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        jsonDecoder = nil
    }

    // MARK: Tests

    func test_initWithDecoder_givenValues_shouldSetValues() throws {
        let data = try Helper.makeRecipesComplexSearchDTOData()
        sut = try jsonDecoder.decode(SUT.self, from: data)

        XCTAssertEqual(sut.number, 5555)
        XCTAssertEqual(sut.offset, 4444)
        XCTAssertEqual(sut.totalResults, 6666)
        XCTAssertEqual(sut.results[0].id, 1111)
        XCTAssertEqual(sut.results[0].image.absoluteString, "https://foo.com/image/0.jpg")
        XCTAssertEqual(sut.results[0].imageType.rawValue, "jpg")
        XCTAssertEqual(sut.results[0].title, "foo.result.0.title")
        XCTAssertEqual(sut.results[1].id, 2222)
        XCTAssertEqual(sut.results[1].image.absoluteString, "https://foo.com/image/1.jpg")
        XCTAssertEqual(sut.results[1].imageType.rawValue, "png")
        XCTAssertEqual(sut.results[1].title, "foo.result.1.title")
    }
}
