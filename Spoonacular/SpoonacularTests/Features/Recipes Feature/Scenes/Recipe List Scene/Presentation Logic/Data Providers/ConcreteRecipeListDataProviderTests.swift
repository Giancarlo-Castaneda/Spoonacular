import XCTest

@testable import Spoonacular

final class ConcreteRecipeListDataProviderTests: XCTestCase {

    // MARK: Typealias

    private typealias SUT = ConcreteRecipeListDataProvider

    // MARK: Private Properties

    private var sut: SUT!
    private var mockViewModelFactory: MockRecipeViewModelFactory!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()

        mockViewModelFactory = .init()
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mockViewModelFactory = nil
    }

    // MARK: Tests

    func test_numberOfSections_shouldReturnValue() throws {
        let recipe = try Helper.makeRecipeModel()

        sut = SUT(recipes: [recipe, recipe, recipe], viewModelFactory: mockViewModelFactory)

        XCTAssertEqual(sut.numberOfSections(), 1)
    }

    func test_numberOfRows_shouldReturnValue() throws {
        let recipe = try Helper.makeRecipeModel()
        mockViewModelFactory.setStubValue(MockRecipeViewModel(), for: .makeRecipeViewModel)

        sut = SUT(recipes: [recipe, recipe], viewModelFactory: mockViewModelFactory)

        XCTAssertEqual(sut.numberOfRows(inSection: 0), 2)
    }

    func test_numberOfRows_whenSectionOutOfRange_shouldReturnZero() throws {
        let recipe = try Helper.makeRecipeModel()

        sut = SUT(recipes: [recipe, recipe, recipe], viewModelFactory: mockViewModelFactory)

        XCTAssertEqual(sut.numberOfRows(inSection: 111), 0)
    }

    func test_viewModel_shouldReturnViewModel() throws {
        let url1 = try XCTUnwrap(URL(string: "foo/0.com"))
        let recipe1 = try Helper.makeRecipeModel(title: "foo.0.title", image: url1)
        let url2 = try XCTUnwrap(URL(string: "foo/1.com"))
        let recipe2 = try Helper.makeRecipeModel(title: "foo.1.title", image: url2)
        let url3 = try XCTUnwrap(URL(string: "foo/2.com"))
        let recipe3 = try Helper.makeRecipeModel(title: "foo.2.title", image: url3)

        sut = SUT(recipes: [recipe1, recipe2, recipe3], viewModelFactory: mockViewModelFactory)

        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 0, section: 0))?.title, "foo.0.title")
        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 0, section: 0))?.image.absoluteString, "foo/0.com")
        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 1, section: 0))?.title, "foo.1.title")
        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 1, section: 0))?.image.absoluteString, "foo/1.com")
        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 2, section: 0))?.title, "foo.2.title")
        XCTAssertEqual(sut.viewModel(at: IndexPath(row: 2, section: 0))?.image.absoluteString, "foo/2.com")
    }

    func test_viewModel_whenIndexPathOutOfRange_shouldReturnNil() throws {
        let recipe = try Helper.makeRecipeModel()

        sut = SUT(recipes: [recipe, recipe], viewModelFactory: mockViewModelFactory)

        XCTAssertNil(sut.viewModel(at: IndexPath(row: 111, section: 222)))
    }
}
