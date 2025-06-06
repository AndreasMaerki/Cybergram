import SwiftUI

struct ProfileView: View {
  @State var showEditProfile: Bool = false
  @Environment(PostGridViewModel.self) var postGridViewModel

  var isCurrentUserProfile: Bool
  var user: User

  var body: some View {
    ScrollView {
      VStack {
        VStack(spacing: 10) {
          HStack {
            CircularProfileImageView(user: user, size: .large)
            Spacer()
            HStack(spacing: 42) {
              statStack(count: 3, description: "Post")
              statStack(count: 3, description: "Followers")
              statStack(count: 3, description: "Following")
            }
          }
          .padding(.horizontal)

          nameAndBio

          if user.isCurrentUser {
            editProfileBTN
          } else {
            followBTN
          }

          Divider()
        }

        PostGridView()
          .environment(postGridViewModel)
      }
    }
    .navigationTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      if isCurrentUserProfile {
        Button {
          AuthService.shared.signout()
        } label: {
          Image(systemName: "line.3.horizontal")
            .foregroundColor(.primaryForeground)
        }
      }
    }
    .fullScreenCover(isPresented: $showEditProfile) {
      EditProfileView(user: user)
    }
    .background(Color.primaryBackground)
  }

  private var nameAndBio: some View {
    VStack(alignment: .leading, spacing: 4) {
      if let fullName = user.fullName {
        Text(fullName)
          .fontWeight(.semibold)
      }

      if let bio = user.bio {
        Text(bio)
      }
    }
    .font(.footnote)
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal)
  }

  private var editProfileBTN: some View {
    Button {
      showEditProfile.toggle()
    } label: {
      Text("Edit Profile")
    }
    .buttonStyle(.borderedButton)
    .padding()
  }

  private var followBTN: some View {
    Button {} label: {
      Text("Follow")
    }
    .buttonStyle(.filledProminentButton)
    .padding()
  }

  private func statStack(count: Int, description: String) -> some View {
    VStack {
      Text("\(count)")
        .font(.subheadline)
        .fontWeight(.semibold)
      Text(description)
        .font(.footnote)
    }
  }
}

#Preview {
  let user = User.MOCK_USERS.first!
  return ProfileView(isCurrentUserProfile: true, user: user)
    .environment(
      PostGridViewModel(
        user: user,
        postService: MockPostService()
      )
    )
}
