public protocol FetchPostsUseCase: Sendable {
  func execute(page: Int) async throws -> [Post]
}

public struct FetchPostsUseCaseImpl: FetchPostsUseCase {
  private let repository: FeedRepository

  public init(repository: FeedRepository) {
    self.repository = repository
  }

  public func execute(page: Int) async throws -> [Post] {
    return try await repository.fetchPosts(page: page)
  }
}
