import Foundation

public final class URLSessionNetworkClient: NetworkClient {
  private let baseURL: URL
  private let session: URLSession
  
  public init(baseURL: URL, session: URLSession = .shared) {
    self.baseURL = baseURL
    self.session = session
  }
  
  public func request<T: Decodable>(
    endpoint: Endpoint
  ) async -> Result<T, NetworkError> {
    await request(endpoint: endpoint, responseType: T.self)
  }
}

private extension URLSessionNetworkClient {
  func request<T: Decodable>(
    endpoint: Endpoint,
    responseType: T.Type
  ) async -> Result<T, NetworkError> {
    do {
      let request = try buildRequest(from: endpoint)
      let (data, response) = try await session.data(for: request)
      try validateResponse(response)
      let decoded = try decode(data, as: responseType)
      return .success(decoded)
    } catch let error as NetworkError {
      return .failure(error)
    } catch {
      return .failure(.unknownError)
    }
  }
  
  func buildRequest(from endpoint: Endpoint) throws -> URLRequest {
    guard var urlComponents = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false) else {
      throw NetworkError.invalidURL
    }
    
    if let queryParameters = endpoint.queryParameters {
      urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    guard let finalURL = urlComponents.url else {
      throw NetworkError.invalidURL
    }
    
    var request = URLRequest(url: finalURL)
    request.httpMethod = endpoint.method.rawValue
    request.allHTTPHeaderFields = endpoint.headers
    
    if let body = endpoint.body {
      request.httpBody = try JSONEncoder().encode(body)
    }
    
    return request
  }
  
  func validateResponse(_ response: URLResponse) throws {
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.requestFailed(statusCode: -1)
    }
    
    guard (200...299).contains(httpResponse.statusCode) else {
      throw NetworkError.requestFailed(statusCode: httpResponse.statusCode)
    }
  }
  
  func decode<T: Decodable>(_ data: Data, as type: T.Type) throws -> T {
    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      throw NetworkError.decodingFailed
    }
  }
}
