public protocol UpdatePostUseCase: Sendable {
  func execute(post: Post)
}

public struct UpdatePostUseCaseImpl: UpdatePostUseCase {
  private let repository: FeedRepository

  public init(repository: FeedRepository) {
    self.repository = repository
  }

  public func execute(post: Post) {
    repository.updatePost(post)
  }
}
