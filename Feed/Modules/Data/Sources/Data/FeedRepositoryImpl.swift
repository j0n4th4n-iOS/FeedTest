import Domain

public final class FeedRepositoryImpl: FeedRepository {
  private let localDataSource: LocalFeedDataSource
  private let dataSource: RemoteFeedDataSource

  public init(dataSource: RemoteFeedDataSource, localDataSource: LocalFeedDataSource) {
    self.dataSource = dataSource
    self.localDataSource = localDataSource
  }


  public func fetchPosts(page: Int) async throws -> [Post] {
    do {
      let posts = try await dataSource.fetchPosts(page: page)
        .map(PostMapper.map(_:))
      try localDataSource.saveAllPosts(posts)
      return posts
    } catch let error as NetworkError {
      throw NetworkErrorMapper.map(error)
    } catch {
      throw DomainError.unknownError
    }
  }

  public func fetchStories(page: Int) async throws -> [Story] {
    do {
      let fetchedDTOs = try await dataSource.fetchStories(page: page)
      let stories = fetchedDTOs.map(StoryMapper.map(_:))

      var storedStories = localDataSource.getAllStories()

      for story in stories {
        if let index = storedStories.firstIndex(where: { $0.id == story.id }) {
          var updatedStory = story
          updatedStory.isSeen = storedStories[index].isSeen
          storedStories[index] = updatedStory
        } else {
          storedStories.append(story)
        }
      }

      try localDataSource.saveAllStories(storedStories)
      return storedStories
    } catch let error as NetworkError {
      throw NetworkErrorMapper.map(error)
    } catch {
      throw DomainError.unknownError
    }
  }

  public func updateStory(_ story: Story) {
    do {
      try localDataSource.updateStory(story)
    } catch {
      print("❌ Failed to update story with id \(story.id): \(error)")
    }
  }

  public func updatePost(_ post: Post) {
    do {
      try localDataSource.updatePost(post)
    } catch {
      print("❌ Failed to update story with id \(post.id): \(error)")
    }
  }

}
