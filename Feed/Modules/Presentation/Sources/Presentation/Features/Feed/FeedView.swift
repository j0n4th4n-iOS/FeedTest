import Domain
import Mock
import SwiftUI

public struct FeedView: View {
  @ObservedObject private var viewModel: FeedViewModel

  public init(viewModel: FeedViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    VStack {
      switch viewModel.state {
      case .loading:
        loadingView()
      case .loaded(let stories, let posts, let selectedStory):
        loadedView(stories: stories, posts: posts, selectedStory: selectedStory)
      case .error(let message):
        errorView(message: message)
      case .empty:
        emptyView()
      }
    }
    .onAppear {
      viewModel.addEvent(.loadFeed)
    }
  }

  // MARK: - State's view

  private func loadingView() -> some View {
    List {
      Section {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(0..<10, id: \.self) { _ in
              ShimmerBubble()
            }
          }
          .padding(.horizontal)
        }
      }
      .listRowInsets(EdgeInsets())
      .listRowSeparator(.hidden)

      Section {
        ForEach(0..<6, id: \.self) { _ in
          ShimmerCell()
            .listRowSeparator(.hidden)
        }
      }
    }
    .listStyle(.plain)
    .refreshable {
      viewModel.addEvent(.loadFeed)
    }
  }

  private func loadedView(stories: [Story], posts: [Post], selectedStory: Story?) -> some View {
    List {
      Section {
        StoryHeaderView(
          stories: stories,
          onStoryTap: { story in
            viewModel.addEvent(.onSelectedStory(story))
          },
          onReachEndStories: {
            viewModel.addEvent(.onStoriesReachedEnd)
          }
        )
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
        .padding(.vertical)
      }

      ForEach(posts) { post in
        PostCell(
          post: post,
          onLikeTapped: {
            viewModel.addEvent(.onLikedPost(post: post))
          }
        )
        .onAppear(perform: {
          if post.id == posts.last?.id {
            viewModel.addEvent(.onPostsReachedEnd)
          }
        })
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
      }
    }
    .listStyle(.plain)
    .refreshable {
      viewModel.addEvent(.loadFeed)
    }
    .sheet(
      item: Binding(
        get: {
          selectedStory
        },
        set: { newValue in
          if newValue == nil {
            viewModel.addEvent(.onCloseStory)
          }
        })
    ) { selected in
      StoryDetailView(story: selected) {
        //viewModel.addEvent(.onCloseStory)
      }
    }
  }

  private func errorView(message: String) -> some View {
    VStack {
      Text(message)
        .foregroundColor(.red)
        .padding()
      Button(action: {
        viewModel.addEvent(.loadFeed)
      }) {
        Label("Reload", systemImage: "arrow.clockwise")
          .font(.title2)
          .padding()
          .background(Color.blue)
          .foregroundColor(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }
    }
  }

  private func emptyView() -> some View {
    VStack(spacing: 16) {
      Image(systemName: "tray.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .foregroundColor(Color.primary)

      Text("No content available")
        .font(.headline)
        .foregroundColor(Color.primary)

      Button(action: {
        viewModel.addEvent(.loadFeed)
      }) {
        Label("Reload", systemImage: "arrow.clockwise")
          .font(.title2)
          .padding()
          .background(Color.blue)
          .foregroundColor(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  /// Use case : Empty State
  //  let viewModel = FeedViewModel(fetchPostsUseCase: MockUseCases.fetchEmptyPostUseCase(), fetchStoriesUseCase: MockUseCases.fetchStoriesUseCase())

  /// Use case : Loaded state
  //  let viewModel = FeedViewModel(fetchPostsUseCase: MockUseCases.fetchPostsUseCase(), fetchStoriesUseCase: MockUseCases.fetchStoriesUseCase())

  /// Use case : Loading state
  let viewModel = FeedViewModel(
    fetchPostsUseCase: MockUseCases.fetchPostsWithDelayUseCase(),
    fetchStoriesUseCase: MockUseCases.fetchStoriesUseCase(),
    updateStoryUseCase: MockUseCases.updateStoryUseCase(),
    updatePostUseCase: MockUseCases.updatePostUseCase()
  )

  /// Use case : Error
  //  let viewModel = FeedViewModel(fetchPostsUseCase: MockUseCases.fetchPostsWithErrorUseCase(), fetchStoriesUseCase: MockUseCases.fetchStoriesUseCase())

  FeedView(viewModel: viewModel)
}
