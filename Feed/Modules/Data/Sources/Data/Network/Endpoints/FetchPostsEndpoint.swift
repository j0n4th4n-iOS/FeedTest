public struct FetchPostsEndpoint: Endpoint {
  public init() {}

  public var path: String { "/posts" }
  public var method: HttpMethod { .get }
  public var headers: [String: String] { [:] }
  public var queryParameters: [String: String]? { nil }
  public var body: Encodable? { nil }
}
