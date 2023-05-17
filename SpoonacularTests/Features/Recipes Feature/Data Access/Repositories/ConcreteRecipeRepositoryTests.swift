import XCTest

@testable import Spoonacular

final class ConcreteRecipeRepositoryTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteRecipeRepository

    // MARK: Private Properties

    private var sut: SUT!
    private var mockNetworkingProvider: MockNetworkingProvider!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockNetworkingProvider = .init()
        sut = SUT(networkingProvider: mockNetworkingProvider)
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockNetworkingProvider = nil
    }

    // MARK: Tests

    func test_fetchRecipeList_shouldCallNetworkingProviderSendRequestWithResponseModel() async throws {
        mockNetworkingProvider.setStubValue(try Helper.makeRecipesComplexSearchDTO(),
                                            for: .sendRequestWithResponseModel)

        XCTAssertFalse(mockNetworkingProvider.verify([.sendRequestWithResponseModel]))

        _ = try await sut.fetchRecipeList(query: "foo.query", recipesPerPage: 1111, offset: 2222)

        XCTAssertTrue(mockNetworkingProvider.verify([.sendRequestWithResponseModel]))
    }

    func test_fetchRecipeList_whenNetworkingProviderResponseIsError_shouldReceiveError() async throws {
        mockNetworkingProvider.setStubValue(Helper.makeError(code: 400), for: .sendRequestWithResponseModel)

        await XCTAssertThrowsAsyncError(try await sut.fetchRecipeList(query: "foo.query",
                                                                      recipesPerPage: 1111,
                                                                      offset: 2222)) { error in

            XCTAssertEqual((error as NSError).code, 400)
        }
    }
}
