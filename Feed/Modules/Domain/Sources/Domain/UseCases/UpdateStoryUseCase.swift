public protocol UpdateStoryUseCase: Sendable {
  func execute(story: Story)
}

public struct UpdateStoryUseCaseImpl: UpdateStoryUseCase {
  private let repository: FeedRepository

  public init(repository: FeedRepository) {
    self.repository = repository
  }

  public func execute(story: Story) {
    repository.updateStory(story)
  }
}
