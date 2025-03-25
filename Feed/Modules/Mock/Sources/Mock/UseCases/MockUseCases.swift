import Data
import Domain

public enum MockUseCases {
  // MARK: - FetchPostsUseCase

  public static func fetchEmptyPostUseCase() -> FetchPostsUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.noPost)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchPostsUseCaseImpl(repository: repository)
  }

  public static func fetchPostsUseCase() -> FetchPostsUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchPostsUseCaseImpl(repository: repository)
  }

  public static func fetchPostsWithDelayUseCase() -> FetchPostsUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts, isLongResponse: true)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchPostsUseCaseImpl(repository: repository)
  }

  public static func fetchPostsWithErrorUseCase() -> FetchPostsUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts, isThrowing: true)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchPostsUseCaseImpl(repository: repository)
  }

  // MARK: - FetchStoriesUseCase

  public static func fetchEmptyStoryUseCase() -> FetchStoriesUseCase {
    let mockDataSource = MockFeedDataSource(stories: MockFeedResources.Dto.noStory)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchStoriesUseCaseImpl(repository: repository)
  }

  public static func fetchStoriesUseCase() -> FetchStoriesUseCase {
    let mockDataSource = MockFeedDataSource(stories: MockFeedResources.Dto.stories)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchStoriesUseCaseImpl(repository: repository)
  }

  public static func fetchStoriesWithDelayUseCase() -> FetchStoriesUseCase {
    let mockDataSource = MockFeedDataSource(stories: MockFeedResources.Dto.stories, isLongResponse: true)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchStoriesUseCaseImpl(repository: repository)
  }

  public static func fetchStoriesWithErrorUseCase() -> FetchStoriesUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts, isThrowing: true)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return FetchStoriesUseCaseImpl(repository: repository)
  }

  public static func updatePostUseCase() -> UpdatePostUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts, stories: MockFeedResources.Dto.stories)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return UpdatePostUseCaseImpl(repository: repository)
  }

  public static func updateStoryUseCase() -> UpdateStoryUseCase {
    let mockDataSource = MockFeedDataSource(posts: MockFeedResources.Dto.posts, stories: MockFeedResources.Dto.stories)
    let repository = FeedRepositoryImpl(dataSource: mockDataSource, localDataSource: LocalFeedDataSourceImpl())
    return UpdateStoryUseCaseImpl(repository: repository)
  }
}
