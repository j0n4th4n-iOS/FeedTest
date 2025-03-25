import Foundation

public enum NetworkError: Error, Equatable, Sendable {
  case invalidURL
  case requestFailed(statusCode: Int)
  case decodingFailed
  case noData
  case unknownError
}
