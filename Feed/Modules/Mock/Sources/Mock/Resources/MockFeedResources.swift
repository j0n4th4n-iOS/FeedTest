import Data
import Domain

public enum MockFeedResources {
  public enum Dto {
    public static let noPost: [PostDTO] = []

    public static let posts: [PostDTO] = [
      PostDTO(
        id: "1",
        username: "john_doe",
        user_avatar_url: "https://randomuser.me/api/portraits/men/1.jpg",
        image_url:
          "https://www.papierpeintpanoramique.fr/media/catalog/product/cache/871f459736130e239a3f5e6472128962/w/0/w05073-small.jpg",
        caption: "Coucher de soleil magnifique !",
        is_liked: false,
        likes_count: 120
      ),
      PostDTO(
        id: "2",
        username: "jane_smith",
        user_avatar_url: "https://randomuser.me/api/portraits/women/2.jpg",
        image_url:
          "https://plus.unsplash.com/premium_photo-1692282102639-233ec9f24468?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y291Y2hlciUyMGRlJTIwc29sZWlsJTIwc3VyJTIwbGUlMjBmb25kJTIwZCVFMiU4MCU5OSVDMyVBOWNyYW4lMjBkZSUyMGxhJTIwcGxhZ2V8ZW58MHx8MHx8fDA%3D",
        caption: "Road trip en montagne 🏔️",
        is_liked: true,
        likes_count: 215
      ),
    ]

    public static let noStory: [StoryDTO] = []

    public static let stories: [StoryDTO] = [
      StoryDTO(
        id: "1",
        username: "john_doe",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: "2",
        username: "very_long_name",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
      StoryDTO(
        id: "3",
        username: "john_doe",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: "4",
        username: "very_long_name",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
      StoryDTO(
        id: "5",
        username: "john_doe",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: "6",
        username: "very_long_name",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
    ]
  }

  public enum Domain {
    public static let noPost: [Post] = []

    public static let posts: [Post] = Dto.posts.map(PostMapper.map(_:))

    public static let noStory: [Story] = []

    public static let stories: [Story] = Dto.stories.map(StoryMapper.map(_:))

  }
}
