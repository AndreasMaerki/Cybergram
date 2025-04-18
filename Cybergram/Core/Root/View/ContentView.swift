import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ContentViewModel()
  @StateObject var searchViewModel: SearchViewModel
  @StateObject var feedViewModel: FeedViewModel
  @StateObject var registrationViewModel = RegistrationViewModel()

  var body: some View {
    Group {
      if viewModel.userSession == nil {
        LoginView()
          .environmentObject(registrationViewModel)
      } else if let currentUser = viewModel.currentUser {
        MainTabView(user: currentUser)
          .environmentObject(searchViewModel)
          .environmentObject(feedViewModel)
          .environmentObject(PostGridViewModel(user: currentUser))
      }
    }
  }
}

#Preview {
  ContentView(
    searchViewModel: SearchViewModel(userService: MockUserService()),
    feedViewModel: FeedViewModel(postService: MockPostService())
  )
}
