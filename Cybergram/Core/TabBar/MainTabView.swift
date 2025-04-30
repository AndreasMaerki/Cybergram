import SwiftUI

struct MainTabView: View {
  let user: User
  @Environment(SearchViewModel.self) var searchViewModel
  @Environment(PostGridViewModel.self) var postGridViewModel
  @Environment(FeedViewModel.self) var feedViewModel

  @State private var selectedIndex = 0
  var body: some View {
    TabView(selection: $selectedIndex) {
      FeedView()
        .tabItem {
          Image(systemName: "house")
        }
        .tag(0)
      SearchView()
        .tabItem {
          Image(systemName: "magnifyingglass")
        }
        .tag(1)
      UploadPostView(tabIndex: $selectedIndex)
        .tabItem {
          Image(systemName: "plus.square")
        }
        .tag(2)
      Text("Notifications\nNot implemented")
        .tabItem {
          Image(systemName: "heart")
        }
        .tag(3)
      NavigationStack {
        ProfileView(isCurrentUserProfile: true, user: user)
      }
      .tabItem {
        Image(systemName: "person")
      }
      .tag(4)
    }
  }
}

#Preview {
  let user = User.MOCK_USERS.first!
  let mockPostService = MockPostService()
  let searchViewModel = SearchViewModel(userService: MockUserService())
  let postGridViewModel = PostGridViewModel(
    user: user,
    postService: mockPostService
  )
  let feedViewModel = FeedViewModel(postService: mockPostService)

  return MainTabView(user: user)
    .environment(searchViewModel)
    .environment(postGridViewModel)
    .environment(feedViewModel)
}
