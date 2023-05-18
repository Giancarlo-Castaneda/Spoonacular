import XCTest

@testable import Spoonacular

final class ConcreteRecipesListPresenterTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteRecipesListPresenter

    // MARK: Private Properties

    private var sut: SUT!
    private var mockView: MockRecipesListPresenterOutput!
    private var mockDataProviderFactory: MockRecipesDataProviderFactory!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockView = .init()
        mockDataProviderFactory = .init()

        sut = SUT(dataProviderFactory: mockDataProviderFactory)
        sut.view = mockView
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockDataProviderFactory = nil
        mockView = nil
    }

    // MARK: Tests

    func test_fetchedRecipes_shouldCallViewConfigureWithContent() async throws {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation
        mockDataProviderFactory.setStubValue(MockRecipeListDataProvider(), for: .makeRecipeListDataProvider)

        XCTAssertFalse(mockView.verify([.configureWithContent]))

        let recipe = try Helper.makeRecipeModel()
        await sut.fetchedRecipes(recipes: [recipe, recipe])

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockView.verify([.configureWithContent]))
        XCTAssertNotNil(mockView.receivedDataProvider)
    }

    func test_loading_shouldCallViewConfigureWithLoading() async {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation

        XCTAssertFalse(mockView.verify([.configureWithLoading]))

        await sut.loading()

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertTrue(mockView.verify([.configureWithLoading]))
    }

    func test_error_shouldCallViewConfigureWithFailure() async {
        let expectation = XCTestExpectation(description: #function)
        mockView.expectation = expectation

        XCTAssertFalse(mockView.verify([.configureWithFailure]))

        await sut.error(Helper.makeError(localizedDescription: #function))

        await fulfillment(of: [expectation], timeout: 1)

        XCTAssertEqual(mockView.receivedFailure?.title, "Error")
        XCTAssertEqual(mockView.receivedFailure?.message, #function)
        XCTAssertTrue(mockView.verify([.configureWithFailure]))
    }

    func test_view_shouldNotRetainView() {
        sut = SUT(dataProviderFactory: mockDataProviderFactory)

        var mockView = MockRecipesListPresenterOutput()
        sut.view = mockView

        mockView = MockRecipesListPresenterOutput()

        XCTAssertNil(sut.view)
    }
}
