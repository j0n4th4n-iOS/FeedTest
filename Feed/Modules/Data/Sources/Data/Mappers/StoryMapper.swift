import Domain

public enum StoryMapper {
  public static func map(_ dto: StoryDTO) -> Story {
    Story(
      id: dto.id,
      username: dto.username,
      imageURL: dto.image_url,
      isSeen: dto.is_seen
    )
  }
}
