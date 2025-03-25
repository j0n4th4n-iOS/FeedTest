import Foundation

public protocol FeedRepository: Sendable {
  func fetchPosts(page: Int) async throws -> [Post]
  func fetchStories(page: Int) async throws -> [Story]
  func updateStory(_ story: Story)
  func updatePost(_ post: Post)

}
