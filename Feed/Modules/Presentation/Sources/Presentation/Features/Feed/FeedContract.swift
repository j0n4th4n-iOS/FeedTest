import Domain

public enum FeedContract {
  public enum FeedState: Equatable, Sendable {
    case empty
    case error(message: String)
    case loaded(stories: [Story], posts: [Post], selectedStory: Story? = nil)
    case loading
  }

  public enum FeedEvent: Sendable {
    case loadFeed
    case retryLoading
    case onLikedPost(post: Post)
    case onSelectedStory(Story)
    case onStoriesReachedEnd
    case onPostsReachedEnd
    case onCloseStory
  }
}
