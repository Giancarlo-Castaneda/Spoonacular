import Foundation

public enum FavoriteRecipesRepositoryError: Error {
    case itemAlreadyExists
    case itemNotFound
}
