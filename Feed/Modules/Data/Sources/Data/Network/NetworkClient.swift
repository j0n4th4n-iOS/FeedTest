import Foundation

public protocol NetworkClient: Sendable {
  func request<T: Decodable>(
    endpoint: Endpoint
  ) async -> Result<T, NetworkError>
}

