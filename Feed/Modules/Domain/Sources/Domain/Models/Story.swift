public struct Story: Identifiable, Codable, Equatable, Sendable {
  public let id: String
  public let username: String
  public let imageURL: String
  public var isSeen: Bool

  public init(id: String, username: String, imageURL: String, isSeen: Bool) {
    self.id = id
    self.username = username
    self.imageURL = imageURL
    self.isSeen = isSeen
  }
}
