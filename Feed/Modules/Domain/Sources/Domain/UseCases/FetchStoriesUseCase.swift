public protocol FetchStoriesUseCase: Sendable {
  func execute(page: Int) async throws -> [Story]
}

public struct FetchStoriesUseCaseImpl: FetchStoriesUseCase {
  private let repository: FeedRepository

  public init(repository: FeedRepository) {
    self.repository = repository
  }

  public func execute(page: Int) async throws -> [Story] {
    let stories = try await repository.fetchStories(page: page)
    let sortedStories = stories.sorted { !$0.isSeen && $1.isSeen }
    return sortedStories
  }
}
