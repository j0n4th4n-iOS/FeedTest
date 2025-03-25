import Domain
import Mock
import SwiftUI

struct PostCell: View {
  let onLikeTapped: () -> Void
  let post: Post

  init(post: Post, onLikeTapped: @escaping () -> Void) {
    self.post = post
    self.onLikeTapped = onLikeTapped
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      headerPostCell()
      contentPostCell()
      footerPostCell()
    }
  }

  private func headerPostCell() -> some View {
    HStack {
      AsyncImage(url: URL(string: post.userAvatarURL)) { image in
        image.resizable()
          .scaledToFit()
      } placeholder: {
        ProgressView()
      }
      .frame(width: 40, height: 40)
      .clipShape(Circle())

      Text(post.username)
        .font(.headline)
        .foregroundColor(.primary)
        .lineLimit(1)
        .truncationMode(.tail)
    }
    .padding(.horizontal)
  }

  private func contentPostCell() -> some View {
    ZStack {
      AsyncImage(url: URL(string: post.imageURL)) { image in
        image.resizable()
          .scaledToFill()
          .frame(maxWidth: .infinity, maxHeight: 300)
          .clipped()
          .blur(radius: 20)
          .opacity(0.5)
      } placeholder: {
        Color.gray.opacity(0.3)
      }

      AsyncImage(url: URL(string: post.imageURL)) { image in
        image.resizable()
          .scaledToFit()
          .frame(maxWidth: .infinity, maxHeight: 300)
          .clipped()
      } placeholder: {
        ProgressView()
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 300)
  }

  private func footerPostCell() -> some View {
    VStack(alignment: .leading) {
      HStack {
        Button(action: {
          onLikeTapped()
        }) {
          Image(systemName: post.isLiked ? "heart.fill" : "heart")
            .foregroundColor(post.isLiked ? .red : .black)
        }
        Text("\(post.likesCount) likes")
      }

      Text(post.caption)
        .font(.body)
        .lineLimit(3)
        .truncationMode(.tail)
    }
    .padding(.horizontal)
  }
}

#Preview {
  VStack(alignment: .leading, spacing: 16) {
    PostCell(post: MockFeedResources.Domain.posts.first!, onLikeTapped: {})
    PostCell(post: MockFeedResources.Domain.posts.last!, onLikeTapped: {})
  }
}
