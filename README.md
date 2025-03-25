# FeedTest

Here are some technical and architectural decisions I made during this challenge:

Architecture
	•	The project is based on a modular Clean Architecture using Swift Package Manager:
	•	Domain: defines business models and use cases.
	•	Data: manages data sources (remote, local) and model mapping.
	•	Presentation: contains the SwiftUI views and ViewModels.
	•	Mock: provides mock data for previews and development purposes.

State Management
	•	The UI is driven by a centralized FeedContract.FeedState, exposed by the FeedViewModel using @Published.
	•	All UI updates go through this published state to ensure consistent rendering.

Use Cases
	•	I chose to isolate use cases from the repository logic to enable specific business operations, such as:
	•	Sorting stories
	•	Filtering posts
	•	This allows for more flexibility and better separation of concerns.

Mocking & Previews (broken at the end with local storage introduction, need updates)
	•	A dedicated Mock module provides mock data for both the app and SwiftUI previews.
	•	A MockUseCases factory simplifies the injection of mocked use cases for local development and tests.

Networking
	•	A reusable NetworkClient was implemented to handle REST API calls.
	•	Errors are mapped from NetworkError to DomainError to maintain domain isolation.
	•	DTOs (PostDTO, StoryDTO) are used to decouple API responses from domain models.

Local Storage
	•	Stories and posts are cached using UserDefaults with basic CRUD operations to simulate local storage.
	•	This enables persistence of the “seen” state on stories.

Pagination & Infinite Scroll
	•	Both stories and posts implement infinite scroll using onAppear detection of the last visible item.
	•	Pagination is handled page by page and aggregates the results.

UX/UI
	•	Inspired by Instagram’s look and feel with shimmering placeholders, modals, and horizontal scrolls.
	•	When tapping on a story, a fullscreen modal appears and marks the story as seen.
 
 
!!!!!! AREAS FOR IMPROVEMENT !!!!!!
  • All the views can be used with previews (mocks data)
  • I misread the brief slightly and confused the "Story view screen" with the feed (posts) itself. As a result, I focused on building a posts feed and didn’t invest enough time into the actual Story screen, which could be improved with gestures, animations or transitions.
  • UserDefaults was used for local persistence because of time constraints and ease of implementation. In a production environment, it would be more appropriate to use Realm or CoreData for scalable and structured local storage.
	•	Improve the scrolling performance by caching images that have already been loaded.
	•	Create a dedicated mock local data source to simulate offline or persisted content more accurately.
	•	Future enhancement: support video playback using AVKit and AVFoundation.
	•	Introduce presentation-specific models to decouple domain logic from UI rendering logic.
	•	Pagination is currently basic: we fetch the next page when reaching the end. Ideally, the API could return the maximum page count or total number of items to avoid unnecessary calls.
	•	If either posts or stories fails to load, the entire feed view displays an error. This could be improved to handle partial failures, allowing the UI to render what’s available.
	•	The layered separation follows the principles of a clean architecture (Presentation, Domain, Data, Mock).
	•	The network service layer is in place, but currently connected to static data. It’s ready to integrate with a real backend API.
	•	Define a design system (typography, spacing, colors, etc.) to extract reusable styles and improve UI consistency across the app. 
  • The like action is currently handled directly by mutating the state in memory. Ideally, it should use the updatePost function from the CRUD implementation to ensure local persistence. 
 AND MORE ... 
