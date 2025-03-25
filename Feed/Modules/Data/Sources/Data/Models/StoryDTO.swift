import Foundation

public struct StoryDTO: Decodable, Sendable, Equatable {
  public let id: String
  public let username: String
  public let image_url: String
  public let is_seen: Bool

  public init(
    id: String,
    username: String,
    image_url: String,
    is_seen: Bool
  ) {
    self.id = id
    self.username = username
    self.image_url = image_url
    self.is_seen = is_seen
  }
}
