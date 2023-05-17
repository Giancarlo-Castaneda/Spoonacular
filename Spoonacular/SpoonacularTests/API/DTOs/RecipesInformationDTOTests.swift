import XCTest

@testable import Spoonacular

final class RecipesInformationDTOTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = RecipesInformationDTO

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

}
