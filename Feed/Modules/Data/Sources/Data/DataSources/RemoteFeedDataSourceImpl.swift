import Foundation
public final class RemoteFeedDataSourceImpl: RemoteFeedDataSource {
  private let client: NetworkClient

  public init(client: NetworkClient) {
    self.client = client
  }

  public func fetchPosts(page: Int) async throws -> [PostDTO] {
    return [
      PostDTO(
        id: UUID().uuidString,
        username: "john_doe",
        user_avatar_url: "https://randomuser.me/api/portraits/men/1.jpg",
        image_url:
          "https://www.papierpeintpanoramique.fr/media/catalog/product/cache/871f459736130e239a3f5e6472128962/w/0/w05073-small.jpg",
        caption: "Coucher de soleil magnifique !",
        is_liked: false,
        likes_count: 120
      ),
      PostDTO(
        id: UUID().uuidString,
        username: "jane_smith",
        user_avatar_url: "https://randomuser.me/api/portraits/women/2.jpg",
        image_url:
          "https://plus.unsplash.com/premium_photo-1692282102639-233ec9f24468?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y291Y2hlciUyMGRlJTIwc29sZWlsJTIwc3VyJTIwbGUlMjBmb25kJTIwZCVFMiU4MCU5OSVDMyVBOWNyYW4lMjBkZSUyMGxhJTIwcGxhZ2V8ZW58MHx8MHx8fDA%3D",
        caption: "Road trip en montagne 🏔️",
        is_liked: true,
        likes_count: 215
      ),
      PostDTO(
        id: UUID().uuidString,
        username: "john_doe",
        user_avatar_url: "https://randomuser.me/api/portraits/men/1.jpg",
        image_url:
          "https://www.papierpeintpanoramique.fr/media/catalog/product/cache/871f459736130e239a3f5e6472128962/w/0/w05073-small.jpg",
        caption: "Coucher de soleil magnifique !",
        is_liked: false,
        likes_count: 655
      ),
      PostDTO(
        id: UUID().uuidString,
        username: "jane_smith",
        user_avatar_url: "https://randomuser.me/api/portraits/women/2.jpg",
        image_url:
          "https://plus.unsplash.com/premium_photo-1692282102639-233ec9f24468?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y291Y2hlciUyMGRlJTIwc29sZWlsJTIwc3VyJTIwbGUlMjBmb25kJTIwZCVFMiU4MCU5OSVDMyVBOWNyYW4lMjBkZSUyMGxhJTIwcGxhZ2V8ZW58MHx8MHx8fDA%3D",
        caption: "Road trip en montagne 🏔️",
        is_liked: true,
        likes_count: 321
      ),
      PostDTO(
        id: UUID().uuidString,
        username: "john_doe",
        user_avatar_url: "https://randomuser.me/api/portraits/men/1.jpg",
        image_url:
          "https://www.papierpeintpanoramique.fr/media/catalog/product/cache/871f459736130e239a3f5e6472128962/w/0/w05073-small.jpg",
        caption: "Coucher de soleil magnifique !",
        is_liked: false,
        likes_count: 900
      ),
      PostDTO(
        id: UUID().uuidString,
        username: "jane_smith",
        user_avatar_url: "https://randomuser.me/api/portraits/women/2.jpg",
        image_url:
          "https://plus.unsplash.com/premium_photo-1692282102639-233ec9f24468?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y291Y2hlciUyMGRlJTIwc29sZWlsJTIwc3VyJTIwbGUlMjBmb25kJTIwZCVFMiU4MCU5OSVDMyVBOWNyYW4lMjBkZSUyMGxhJTIwcGxhZ2V8ZW58MHx8MHx8fDA%3D",
        caption: "Road trip en montagne 🏔️",
        is_liked: true,
        likes_count: 876
      ),
    ]

    //        let fetchPostsEndpoint = FetchPostsEndpoint()
    //        let result: Result<[PostDTO], NetworkError> = await client.request(endpoint: fetchPostsEndpoint)
    //        switch result {
    //        case .success(let posts):
    //          guard !posts.isEmpty else {
    //            throw NetworkError.noData
    //          }
    //          return posts
    //
    //        case .failure(let error):
    //          throw error
    //        }
  }

  public func fetchStories(page: Int) async throws -> [StoryDTO] {
    return [
      StoryDTO(
        id: UUID().uuidString,
        username: "john_doe_1",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: UUID().uuidString,
        username: "very_long_name_2",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
      StoryDTO(
        id: UUID().uuidString,
        username: "john_doe_3",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: UUID().uuidString,
        username: "very_long_name_4",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
      StoryDTO(
        id: UUID().uuidString,
        username: "john_doe_5",
        image_url: "https://randomuser.me/api/portraits/men/3.jpg",
        is_seen: false
      ),
      StoryDTO(
        id: UUID().uuidString,
        username: "very_long_name_6",
        image_url: "https://randomuser.me/api/portraits/women/4.jpg",
        is_seen: true
      ),
    ]

    //        let fetchStoriesEndpoint = FetchStoriesEndpoint()
    //        let result: Result<[StoryDTO], NetworkError> = await client.request(endpoint: fetchStoriesEndpoint)
    //
    //        switch result {
    //        case .success(let stories):
    //          guard !stories.isEmpty else {
    //            throw NetworkError.noData
    //          }
    //          return stories
    //
    //        case .failure(let error):
    //          throw error
    //        }
  }
}
