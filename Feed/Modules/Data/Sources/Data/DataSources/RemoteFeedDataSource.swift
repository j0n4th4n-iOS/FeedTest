import Domain

public protocol RemoteFeedDataSource: Sendable {
  func fetchPosts(page: Int) async throws -> [PostDTO]
  func fetchStories(page: Int) async throws -> [StoryDTO]
}
