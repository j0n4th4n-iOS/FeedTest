public struct Post: Identifiable, Codable, Equatable, Sendable {
  public let id: String
  public let username: String
  public let userAvatarURL: String
  public let imageURL: String
  public let caption: String
  public var isLiked: Bool
  public var likesCount: Int

  public init(
    id: String,
    username: String,
    userAvatarURL: String,
    imageURL: String,
    caption: String,
    isLiked: Bool,
    likesCount: Int
  ) {
    self.id = id
    self.username = username
    self.userAvatarURL = userAvatarURL
    self.imageURL = imageURL
    self.caption = caption
    self.isLiked = isLiked
    self.likesCount = likesCount
  }
}
