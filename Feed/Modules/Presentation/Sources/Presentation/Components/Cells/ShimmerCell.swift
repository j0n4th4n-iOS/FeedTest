import SwiftUI

struct ShimmerCell: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        ShimmerView()
          .frame(width: 40, height: 40)
          .clipShape(Circle())

        ShimmerView()
          .frame(width: 120, height: 16)
      }

      ShimmerView()
        .frame(height: 200)
        .cornerRadius(12)

      ShimmerView()
        .frame(width: 180, height: 16)
    }
  }
}

#Preview {
  VStack(spacing: 16) {
    ShimmerCell()
    ShimmerCell()
  }
  .padding()
}
