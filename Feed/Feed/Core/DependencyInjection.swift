import Data
import Domain
import Foundation
import Mock
import Presentation

@MainActor
class DependencyInjection {
  static let shared = DependencyInjection()

  private init() {}

  func makeFeedViewModel(environment: AppEnvironment = .current) -> FeedViewModel {
    let dataSource: RemoteFeedDataSource = {
      if environment == .mock {
        return MockFeedDataSource()
      } else {
        guard let baseURL = URL(string: "https://jsonplaceholder.typicode.com") else {
          fatalError("❌ Invalid base URL")
        }
        return RemoteFeedDataSourceImpl(client: URLSessionNetworkClient(baseURL: baseURL))
      }
    }()

    let localDataSource = LocalFeedDataSourceImpl()

    let repository = FeedRepositoryImpl(dataSource: dataSource, localDataSource: localDataSource)

    let fetchPostsUseCase = FetchPostsUseCaseImpl(repository: repository)
    let fetchStoriesUseCase = FetchStoriesUseCaseImpl(repository: repository)
    let updateStoryUseCase = UpdateStoryUseCaseImpl(repository: repository)
    let updatePostUseCase = UpdatePostUseCaseImpl(repository: repository)

    return FeedViewModel(
      fetchPostsUseCase: fetchPostsUseCase, fetchStoriesUseCase: fetchStoriesUseCase,
      updateStoryUseCase: updateStoryUseCase, updatePostUseCase: updatePostUseCase)
  }
}
