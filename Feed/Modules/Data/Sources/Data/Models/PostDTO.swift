public struct PostDTO: Decodable, Sendable, Equatable {
  public let id: String
  let username: String
  let user_avatar_url: String
  let image_url: String
  let caption: String
  let is_liked: Bool
  let likes_count: Int

  public init(
    id: String,
    username: String,
    user_avatar_url: String,
    image_url: String,
    caption: String,
    is_liked: Bool,
    likes_count: Int
  ) {
    self.id = id
    self.username = username
    self.user_avatar_url = user_avatar_url
    self.image_url = image_url
    self.caption = caption
    self.is_liked = is_liked
    self.likes_count = likes_count
  }
}
