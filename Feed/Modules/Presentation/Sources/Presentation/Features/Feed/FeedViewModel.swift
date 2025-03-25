import Domain
import Foundation

@MainActor
public final class FeedViewModel: ObservableObject {
  @Published public private(set) var state: FeedContract.FeedState = .loading

  private var currentStoriesPage = 1
  private var currentPostsPage = 1
  private let pageSize = 10

  private let fetchPostsUseCase: FetchPostsUseCase
  private let fetchStoriesUseCase: FetchStoriesUseCase
  private let updateStoryUseCase: UpdateStoryUseCase
  private let updatePostUseCase: UpdatePostUseCase

  public init(fetchPostsUseCase: FetchPostsUseCase, fetchStoriesUseCase: FetchStoriesUseCase, updateStoryUseCase: UpdateStoryUseCase, updatePostUseCase: UpdatePostUseCase) {
    self.fetchPostsUseCase = fetchPostsUseCase
    self.fetchStoriesUseCase = fetchStoriesUseCase
    self.updatePostUseCase = updatePostUseCase
    self.updateStoryUseCase = updateStoryUseCase
  }

  public func addEvent(_ event: FeedContract.FeedEvent) {
    Task { [weak self] in
      guard let self else { return }
      await self.handleEvent(event)
    }
  }

  private func handleEvent(_ event: FeedContract.FeedEvent) async {
    switch event {
    case .loadFeed:
      await loadFeed()
    case .onLikedPost(let post):
      await toggleLike(for: post)
    case .retryLoading:
      await loadFeed()
    case .onSelectedStory(let story):
      await select(story: story)
    case .onStoriesReachedEnd:
      await loadNextStoriesPage()
    case .onPostsReachedEnd:
      await loadNextPostsPage()
    case .onCloseStory:
      await closeStory()
    }
  }

  private func loadFeed() async {
    setState(.loading)

    async let storiesResult = fetchStoriesUseCase.execute(page: currentStoriesPage)
    async let postsResult = fetchPostsUseCase.execute(page: currentPostsPage)

    do {
      let (stories, posts) = try await (storiesResult, postsResult)
      setState(.loaded(stories: stories, posts: posts))
    } catch let error as DomainError {
      handleDomainError(error: error)
    } catch {
      setState(.error(message: "An unexpected error occurred. Please try again."))
    }
  }

  private func handleDomainError(error: DomainError) {
    switch error {
    case .emptyResponse:
      setState(.empty)
    case .networkFailure, .parsingError, .serverError, .unknownError:
      setState(.error(message: error.localizedDescription))
    }
  }

  private func toggleLike(for post: Post) async {
    guard case .loaded(let stories, var posts, _) = state,
      let index = posts.firstIndex(where: { $0.id == post.id })
    else { return }

    // TODO: Should call repository > remote data source > API update posts

    posts[index].isLiked.toggle()
    posts[index].likesCount += posts[index].isLiked ? 1 : -1

    setState(.loaded(stories: stories, posts: posts))
  }

  private func select(story: Story) async {
    guard case .loaded(let stories, let posts, _) = state else { return }

    setState(.loaded(stories: stories, posts: posts, selectedStory: story))
  }

  private func loadNextStoriesPage() async {
    guard case .loaded(var currentStories, let posts, let selectedStory) = state else { return }

    do {
      currentStoriesPage += 1
      let newStories = try await fetchStoriesUseCase.execute(page: currentStoriesPage)

      currentStories.append(contentsOf: newStories)
      setState(.loaded(stories: currentStories, posts: posts, selectedStory: selectedStory))
    } catch let error as DomainError {
      handleDomainError(error: error)
    } catch {
      setState(.error(message: "An unexpected error occurred. Please try again."))
    }
  }

  private func loadNextPostsPage() async {
    guard case .loaded(let stories, var currentPosts, let selectedStory) = state else { return }

    do {
      currentPostsPage += 1
      let newPosts = try await fetchPostsUseCase.execute(page: currentPostsPage)

      currentPosts.append(contentsOf: newPosts)
      setState(.loaded(stories: stories, posts: currentPosts, selectedStory: selectedStory))
    } catch let error as DomainError {
      handleDomainError(error: error)
    } catch {
      setState(.error(message: "An unexpected error occurred. Please try again."))
    }
  }

  private func closeStory() async {
    guard
      case .loaded(var stories, let posts, let selected) = state,
      let selectedStory = selected
    else { return }

    if let index = stories.firstIndex(where: { $0.id == selectedStory.id }) {
      stories[index].isSeen = true
      updateStoryUseCase.execute(story: stories[index])
    }

    setState(.loaded(stories: stories, posts: posts, selectedStory: nil))
  }

  private func setState(_ newState: FeedContract.FeedState) {
    guard state != newState else { return }
    self.state = newState
  }
}
