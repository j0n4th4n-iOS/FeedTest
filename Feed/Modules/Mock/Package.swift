// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

import PackageDescription

let package = Package(
  name: "Mock",
  platforms: [.iOS(.v16)],
  products: [
    .library(name: "Mock", targets: ["Mock"]),
  ],
  dependencies: [
    .package(name: "Data", path: "../Data"),
    .package(name: "Domain", path: "../Domain")
  ],
  targets: [
    .target(
      name: "Mock",
      dependencies: ["Data", "Domain"],
      path: "Sources"
    )
  ]
)
