import Domain
import Mock
import SwiftUI
import SwiftUI
import Domain

public struct StoryDetailView: View {
  let story: Story
  let onClose: () -> Void

  public init(story: Story, onClose: @escaping () -> Void) {
    self.story = story
    self.onClose = onClose
  }

  public var body: some View {
    ZStack(alignment: .topTrailing) {
      AsyncImage(url: URL(string: story.imageURL)) { image in
        image.resizable()
          .scaledToFill()
          .clipped()
      } placeholder: {
        ProgressView()
      }
      .ignoresSafeArea()

      Button(action: {
        onClose()
      }) {
        Image(systemName: "xmark.circle.fill")
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundColor(.white)
          .background(
            Circle()
              .fill(Color.black.opacity(0.5))
          )
      }
      .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 16))
    }
  }
}

#Preview {
  StoryDetailView(story: MockFeedResources.Domain.stories.first!, onClose: {})
}
