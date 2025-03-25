import Domain
import Mock
import SwiftUI

struct StoryHeaderView: View {
  let stories: [Story]
  let onStoryTap: (Story) -> Void
  let onReachEndStories: () -> Void

  var body: some View {
    ScrollViewReader { scrollProxy in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          ForEach(stories) { story in
            StoryBubble(story: story)
              .id(story.id)
              .onTapGesture {
                onStoryTap(story)
              }
              .background(
                GeometryReader { geo in
                  Color.clear
                    .onChange(of: geo.frame(in: .global).minX) { value in
                      if story.id == stories.last?.id, value < UIScreen.main.bounds.width {
                        onReachEndStories()
                      }
                    }
                }
              )
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

#Preview {
  StoryHeaderView(stories: MockFeedResources.Domain.stories, onStoryTap: { _ in }, onReachEndStories: {})
}
