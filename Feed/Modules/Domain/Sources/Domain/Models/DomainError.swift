public enum DomainError: Error, Equatable, Sendable {
  case networkFailure
  case serverError(statusCode: Int)
  case emptyResponse
  case parsingError
  case unknownError

  public var localizedDescription: String {
    switch self {
    case .networkFailure:
      return "Network connection failed."
    case .serverError(let statusCode):
      return "Server error: Code \(statusCode)"
    case .emptyResponse:
      return "No data received."
    case .parsingError:
      return "Data processing error."
    case .unknownError:
      return "An unknown error has occurred."
    }
  }
}

