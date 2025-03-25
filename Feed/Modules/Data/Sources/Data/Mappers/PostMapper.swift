import Domain

public enum PostMapper {
  public static func map(_ dto: PostDTO) -> Post {
    Post(
      id: dto.id,
      username: dto.username,
      userAvatarURL: dto.user_avatar_url,
      imageURL: dto.image_url,
      caption: dto.caption,
      isLiked: dto.is_liked,
      likesCount: dto.likes_count
    )
  }
}
