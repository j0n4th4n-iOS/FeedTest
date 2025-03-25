import SwiftUI

struct ShimmerBubble: View {
  var body: some View {
    VStack(spacing: 6) {
      ShimmerView()
        .frame(width: 64, height: 64)
        .clipShape(Circle())

      ShimmerView()
        .frame(width: 50, height: 12)
        .cornerRadius(6)
    }
    .frame(width: 72)
  }
}

#Preview {
  HStack(spacing: 12) {
    ShimmerBubble()
    ShimmerBubble()
    ShimmerBubble()
  }

}
