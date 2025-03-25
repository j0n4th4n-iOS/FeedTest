// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Presentation",
  platforms: [.iOS(.v16)],
  products: [
    .library(name: "Presentation", targets: ["Presentation"])
  ],
  dependencies: [
    .package(path: "../Domain"),
    .package(path: "../Mock")
  ],
  targets: [
    .target(name: "Presentation", dependencies: ["Domain", "Mock"]),
    .testTarget(name: "PresentationTests", dependencies: ["Presentation"])
  ]
)
