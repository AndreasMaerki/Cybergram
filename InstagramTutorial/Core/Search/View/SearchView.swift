import SwiftUI

struct SearchView: View {
  @State private var searchText = ""
  @StateObject var viewModel = SearchViewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(viewModel.users) { user in
            NavigationLink(value: user) {
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
    }
  }
}

#Preview {
  SearchView()
}
