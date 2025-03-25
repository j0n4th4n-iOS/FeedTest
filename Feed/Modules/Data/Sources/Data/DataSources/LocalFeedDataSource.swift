import Domain

public protocol LocalFeedDataSource: Sendable {
  // MARK: - CRUD Story
  func getAllStories() -> [Story]
  func saveAllStories(_ stories: [Story]) throws
  func updateStory(_ updatedStory: Story) throws
  func deleteAllStories()
  func deleteStory(by id: String)

  // MARK: - CRUD Post
  func getAllPosts() -> [Post]
  func saveAllPosts(_ stories: [Post]) throws
  func updatePost(_ updatedStory: Post) throws
  func deleteAllPosts()
  func deletePost(by id: String)
}
