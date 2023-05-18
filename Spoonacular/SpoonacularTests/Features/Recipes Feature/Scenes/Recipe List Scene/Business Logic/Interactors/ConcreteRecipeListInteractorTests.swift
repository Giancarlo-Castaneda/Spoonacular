import XCTest

@testable import Spoonacular

final class ConcreteRecipeListInteractorTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteRecipeListInteractor

    // MARK: Private Properties

    private var sut: SUT!
    private var mockFetchRecipeListWorker: MockFetchRecipeListWorker!
    private var mockIsInternetReachableWorker: MockIsInternetReachableWorker!
    private var mockPresenter: MockRecipeListInteractorOutput!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockPresenter = .init()
        mockFetchRecipeListWorker = .init()
        mockIsInternetReachableWorker = .init()
        sut = SUT(fetchRecipeListWorker: mockFetchRecipeListWorker,
                  isInternetReachableWorker: mockIsInternetReachableWorker)
        sut.presenter = mockPresenter
    }

    override func tearDown() {
        super.tearDown()

        mockPresenter = nil
        mockFetchRecipeListWorker = nil
        sut = nil
    }

    // MARK: Tests

    func test_fetchRecipes_shouldCallFetchRecipeListWorkerExecute() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockFetchRecipeListWorker.setStubValue(Helper.makeRecipeListModel(), for: .execute)
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)

        XCTAssertFalse(mockFetchRecipeListWorker.verify([.execute]))

        sut.fetchRecipes(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockFetchRecipeListWorker.verify([.execute]))
        XCTAssertEqual(mockFetchRecipeListWorker.receivedQuery, "foo.query")
        XCTAssertEqual(mockFetchRecipeListWorker.receivedOffset, 0)
        XCTAssertEqual(mockFetchRecipeListWorker.receivedRecipesPerPage, 20)
    }

    func test_fetchRecipes_shouldCallPresenterFetchedRecipes() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)
        mockFetchRecipeListWorker.setStubValue(Helper.makeRecipeListModel(), for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .fetchedRecipes]))

        sut.fetchRecipes(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.loading, .fetchedRecipes]))
    }

    func test_fetchRecipes_whenIsInternetReachableWorkerReturnFalse_shouldCallPresenterNoInternetConnection() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(false, for: .execute)

        XCTAssertFalse(mockPresenter.verify([.noInternetConnection]))

        sut.fetchRecipes(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.noInternetConnection]))
    }

    func test_fetchRecipes_whenFetchRecipeListWorkerThrowsError_shouldCallPresenterError() async {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)
        mockFetchRecipeListWorker.setStubValue(Helper.makeError(code: 400), for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .error]))

        sut.fetchRecipes(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.loading, .error]))
    }

    func test_fetchRecipes_whenIsCalledMultiplesTimesBeforeResponse_shouldCallPresenterFetchedRecipesOnce() async throws {
        let expectation = XCTestExpectation(description: #function)
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)
        let recipe = try Helper.makeRecipeModel()
        mockFetchRecipeListWorker.setStubValue(Helper.makeRecipeListModel(recipes: [recipe, recipe],
                                                                          totalResults: 2),
                                               for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .fetchedRecipes]))

        sut.fetchRecipes(query: "foo.query")
        sut.fetchRecipes(query: "foo.query")

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockPresenter.verify([.loading, .fetchedRecipes]))
        XCTAssertEqual(mockPresenter.receivedRecipes.count, 2)
    }

    func test_fetchRecipes_whenIsCalledMultiplesTimes_shouldCallPresenterFetchedRecipesMultiplesTimes() async throws {
        let expectation = XCTestExpectation(description: #function)
        expectation.expectedFulfillmentCount = 2
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)
        let recipe = try Helper.makeRecipeModel()
        mockFetchRecipeListWorker.setStubValue(Helper.makeRecipeListModel(recipes: [recipe, recipe],
                                                                          totalResults: 111),
                                               for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .fetchedRecipes]))

        sut.fetchRecipes(query: "foo.query")

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.sut.fetchRecipes(query: "foo.query")
        }

        await fulfillment(of: [expectation], timeout: 2)

        XCTAssertTrue(mockPresenter.verify([.loading, .fetchedRecipes, .loading, .fetchedRecipes]))
        XCTAssertEqual(mockPresenter.receivedRecipes.count, 4)
    }

    func test_fetchRecipes_whenOffsetReachTotalResults_shouldNotCallPresenterFetchedRecipes() async throws {
        let expectation = XCTestExpectation(description: #function)
        expectation.expectedFulfillmentCount = 2
        mockPresenter.expectation = expectation
        mockIsInternetReachableWorker.setStubValue(true, for: .execute)
        let recipe = try Helper.makeRecipeModel()
        mockFetchRecipeListWorker.setStubValue(Helper.makeRecipeListModel(recipes: [recipe, recipe],
                                                                          totalResults: 4),
                                               for: .execute)

        XCTAssertFalse(mockPresenter.verify([.loading, .fetchedRecipes]))

        sut.fetchRecipes(query: "foo.query")

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.sut.fetchRecipes(query: "foo.query")
        }

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.sut.fetchRecipes(query: "foo.query")
        }

        await fulfillment(of: [expectation], timeout: 2)

        XCTAssertTrue(mockPresenter.verify([.loading, .fetchedRecipes, .loading, .fetchedRecipes]))
        XCTAssertEqual(mockPresenter.receivedRecipes.count, 4)
    }
}
