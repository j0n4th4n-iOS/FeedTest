import SwiftUI

struct ShimmerView: View {
  @State private var shimmerOffset: CGFloat = -200

  var body: some View {
    RoundedRectangle(cornerRadius: 8)
      .fill(Color.gray.opacity(0.3))
      .overlay(
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.6), Color.gray.opacity(0.3), Color.white.opacity(0.6)]),
          startPoint: .leading, endPoint: .trailing
        )
        .mask(
          Rectangle()
            .fill(
              LinearGradient(
                gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.6), Color.clear]),
                startPoint: .leading, endPoint: .trailing)
            )
            .offset(x: -100)
            .onAppear(perform: {
              withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                shimmerOffset = 200
              }
            })
        )
      )
  }
}

#Preview {
  ShimmerView()
    .frame(width: .infinity, height: 16)
    .padding()
}
