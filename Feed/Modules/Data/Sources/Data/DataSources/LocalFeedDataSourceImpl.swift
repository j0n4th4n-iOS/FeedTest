import Domain
import Foundation

public final class LocalFeedDataSourceImpl: LocalFeedDataSource {
  private let keyStories = "stored_stories"
  private let keyPosts = "stored_posts"

  public init() {}

  // MARK: - Stories

  public func getAllStories() -> [Story] {
    guard let data = UserDefaults.standard.data(forKey: keyStories),
          let stories = try? JSONDecoder().decode([Story].self, from: data) else {
      return []
    }
    return stories
  }

  public func saveAllStories(_ stories: [Story]) throws {
    let data = try JSONEncoder().encode(stories)
    UserDefaults.standard.set(data, forKey: keyStories)
  }

  public func updateStory(_ updatedStory: Story) throws {
    var stories = getAllStories()

    if let index = stories.firstIndex(where: { $0.id == updatedStory.id }) {
      stories[index] = updatedStory
      try saveAllStories(stories)
    } else {
      stories.append(updatedStory)
      try saveAllStories(stories)
    }
  }

  public func deleteAllStories() {
    UserDefaults.standard.removeObject(forKey: keyStories)
  }

  public func deleteStory(by id: String) {
    var stories = getAllStories()
    stories.removeAll { $0.id == id }
    try? saveAllStories(stories)
  }

  // MARK: - Posts

  public func getAllPosts() -> [Post] {
    guard let data = UserDefaults.standard.data(forKey: keyPosts),
          let posts = try? JSONDecoder().decode([Post].self, from: data) else {
      return []
    }
    return posts
  }

  public func saveAllPosts(_ posts: [Post]) throws {
    let data = try JSONEncoder().encode(posts)
    UserDefaults.standard.set(data, forKey: keyPosts)
  }

  public func updatePost(_ updatedPost: Post) throws {
    var posts = getAllPosts()

    if let index = posts.firstIndex(where: { $0.id == updatedPost.id }) {
      posts[index] = updatedPost
      try saveAllPosts(posts)
    } else {
      posts.append(updatedPost)
      try saveAllPosts(posts)
    }
  }

  public func deleteAllPosts() {
    UserDefaults.standard.removeObject(forKey: keyPosts)
  }

  public func deletePost(by id: String) {
    var posts = getAllPosts()
    posts.removeAll { $0.id == id }
    try? saveAllPosts(posts)
  }
}
