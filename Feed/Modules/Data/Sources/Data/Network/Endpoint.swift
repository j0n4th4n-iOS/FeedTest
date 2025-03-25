import Foundation

public enum HttpMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}

public protocol Endpoint {
  var path: String { get }
  var method: HttpMethod { get }
  var headers: [String: String] { get }
  var queryParameters: [String: String]? { get }
  var body: Encodable? { get }
}
