import SwiftUI
import Presentation

@main
struct FeedApp: App {
  var body: some Scene {
    WindowGroup {
      FeedView(viewModel: DependencyInjection.shared.makeFeedViewModel())
    }
  }
}
