import Foundation

enum AppEnvironment {
  case production
  case mock

  static var current: AppEnvironment {
#if DEBUG
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" ? .mock : .production
#else
    return .production
#endif
  }
}

