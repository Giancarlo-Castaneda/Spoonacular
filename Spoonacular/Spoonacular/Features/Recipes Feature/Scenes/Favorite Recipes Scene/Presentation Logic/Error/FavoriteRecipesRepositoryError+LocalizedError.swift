import Foundation

// MARK: - LocalizedError

extension FavoriteRecipesRepositoryError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .itemAlreadyExists:
            return "This recipe is already on your favorites list"

        case .itemNotFound:
            return "Couldn't delete, you need to add it first"
        }
    }
}
