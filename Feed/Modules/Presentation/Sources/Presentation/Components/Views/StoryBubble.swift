import SwiftUI
import Domain
import Mock

struct StoryBubble: View {
  let story: Story

  var body: some View {
    VStack {
      ZStack {
        Circle()
          .strokeBorder(story.isSeen ? grayGradient : instagramGradient, lineWidth: 3)
          .frame(width: 72, height: 72)

        AsyncImage(url: URL(string: story.imageURL)) { image in
          image.resizable()
        } placeholder: {
          Circle().fill(Color.gray.opacity(0.3))
        }
        .frame(width: 64, height: 64)
        .clipShape(Circle())
      }

      Text(story.username)
        .font(.caption)
        .foregroundColor(.primary)
        .lineLimit(1)
        .truncationMode(.tail)
    }
    .frame(width: 80)
  }

  private var grayGradient: AngularGradient {
    AngularGradient(
      gradient: Gradient(colors: [.gray, .gray]),
      center: .center
    )
  }

  private var instagramGradient: AngularGradient {
    AngularGradient(
      gradient: Gradient(colors: [.red, .orange, .yellow, .purple, .pink, .red]),
      center: .center)
  }
}

#Preview {
  HStack(spacing: 16) {
    StoryBubble(story: MockFeedResources.Domain.stories.first!)
    StoryBubble(story: MockFeedResources.Domain.stories.last!)
  }
}
