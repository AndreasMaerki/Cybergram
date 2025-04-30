import SwiftUI

struct SearchView: View {
  @State private var searchText = ""
  @Environment(SearchViewModel.self) var viewModel

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(viewModel.users) { user in
            NavigationLink(value: user) {
              searchCell(user: user)
            }
          }
          .padding(.top, 8)
          .searchable(text: $searchText, prompt: "Search")
        }
        .navigationDestination(for: User.self, destination: { user in
          ProfileView(isCurrentUserProfile: false, user: user)
        })
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
      }
      .background(Color.primaryBackground)
    }
  }

  private func searchCell(user: User) -> some View {
    VStack {
      HStack {
        CircularProfileImageView(user: user, size: .xSmall)
        VStack(alignment: .leading) {
          Text(user.userName)
            .fontWeight(.semibold)

          if let fullName = user.fullName {
            Text(fullName)
          }
        }
        .font(.footnote)
        Spacer()
      }
      .padding(.horizontal)
      .foregroundStyle(Color.primary)
    }
  }
}

#Preview {
  SearchView()
    .environment(SearchViewModel(userService: MockUserService()))
}
