import SwiftUI

struct ContentView: View {
  @State var viewModel = ContentViewModel()
  @State var searchViewModel: SearchViewModel
  @State var feedViewModel: FeedViewModel
  @State var registrationViewModel = RegistrationViewModel()

  var body: some View {
    Group {
      if viewModel.userSession == nil {
        LoginView()
          .environment(registrationViewModel)
      } else if let currentUser = viewModel.currentUser {
        MainTabView(user: currentUser)
          .environment(searchViewModel)
          .environment(feedViewModel)
          .environment(PostGridViewModel(user: currentUser))
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
