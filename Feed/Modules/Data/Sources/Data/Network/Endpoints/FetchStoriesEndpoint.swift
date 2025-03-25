public struct FetchStoriesEndpoint: Endpoint {
  public init() {}

  public var path: String { "/stories" }
  public var method: HttpMethod { .get }
  public var headers: [String: String] { [:] }
  public var queryParameters: [String: String]? { nil }
  public var body: Encodable? { nil }
}
