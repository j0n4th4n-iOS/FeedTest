import Data
import Domain

public final class MockFeedDataSource: RemoteFeedDataSource {
  public let posts: [PostDTO]
  public let stories: [StoryDTO]
  private let isLongResponse: Bool
  private let isThrowing: Bool

  public init(posts: [PostDTO] = [], stories: [StoryDTO] = [], isLongResponse: Bool = false, isThrowing: Bool = false) {
    self.posts = posts
    self.stories = stories
    self.isLongResponse = isLongResponse
    self.isThrowing = isThrowing
  }

  public func fetchPosts(page: Int) async throws -> [PostDTO] {
    guard !isThrowing else {
      throw DomainError.networkFailure
    }

    await shouldForceLongResponse()

    guard !posts.isEmpty else {
      throw DomainError.emptyResponse
    }

    return posts
  }

  public func fetchStories(page: Int) async throws -> [StoryDTO] {
    guard !isThrowing else {
      throw DomainError.networkFailure
    }

    await shouldForceLongResponse()

    guard !stories.isEmpty else {
      throw DomainError.emptyResponse
    }

    return stories
  }

  private func shouldForceLongResponse() async {
    if isLongResponse {
      try? await Task.sleep(nanoseconds: 5_000_000_000)
    }
  }
}
