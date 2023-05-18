import Foundation
import Spoonacular
import XCTest

final class MockRecipesListPresenterOutput: RecipesListPresenterOutput, Mockable {

    // MARK: - Mockable

    enum Invocation {
        case configureWithContent
        case configureWithFailure
        case configureWithLoading
    }

    // MARK: - Internal Properties

    var expectation: XCTestExpectation?
    var receivedState: RecipeListViewState?
    var receivedDataProvider: RecipeListDataProvider?
    var receivedFailure: (title: String, message: String)?

    // MARK: - Internal Methods

    func configure(state: RecipeListViewState) {
        receivedState = state

        switch state {
        case let .content(dataProvider):
            append(.configureWithContent)
            receivedDataProvider = dataProvider

        case let .failure(title, message):
            append(.configureWithFailure)
            receivedFailure = (title, message)

        case .loading:
            append(.configureWithLoading)
        }

        expectation?.fulfill()
    }
}
