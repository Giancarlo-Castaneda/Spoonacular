import XCTest

@testable import Spoonacular

final class ConcreteFetchRecipeListWorkerTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteFetchRecipeListWorker

    // MARK: Private Properties

    private var sut: SUT!
    private var mockRepository: MockRecipeRepository!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockRepository = .init()
        sut = SUT(repository: mockRepository)
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockRepository = nil
    }

    // MARK: Tests

    func test_execute_shouldCallRepositoryFetchRecipeList() async throws {
        mockRepository.setStubValue(Helper.makeRecipeListModel(), for: .fetchRecipeList)

        XCTAssertFalse(mockRepository.verify([.fetchRecipeList]))

        _ = try await sut.execute(query: "foo.query")

        XCTAssertTrue(mockRepository.verify([.fetchRecipeList]))
        XCTAssertEqual(mockRepository.receivedQuery, "foo.query")
    }

    func test_execute_whenRepositoryThrowsAnError_shouldThrowError() async throws {
        mockRepository.setStubValue(Helper.makeError(code: 400), for: .fetchRecipeList)

        await XCTAssertThrowsAsyncError(try await sut.execute(query: "foo.query")) { error in
            XCTAssertEqual((error as NSError).code, 400)
        }
    }
}
