import Domain

public enum NetworkErrorMapper {
  public static func map(_ error: NetworkError) -> DomainError {
    switch error {
    case .invalidURL:
      return .networkFailure
    case .requestFailed(let code):
      return .serverError(statusCode: code)
    case .decodingFailed:
      return .parsingError
    case .noData:
      return .emptyResponse
    case .unknownError:
      return .unknownError
    }
  }
}
