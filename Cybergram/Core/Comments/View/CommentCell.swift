import SwiftUI

struct CommentCell: View {
  private var user = User.MOCK_USERS.first!
  var body: some View {
    HStack {
      CircularProfileImageView(user: user, size: .xSmall)
      VStack(alignment: .leading, spacing: 4.0) {
        HStack(alignment: .bottom, spacing: 4.0) {
          Text(user.userName)
            .fontWeight(.semibold)
          Text("6d")
            .foregroundStyle(.secondary)
        }
        Text("Hi there is great")
      }
      .font(.caption)
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  CommentCell()
}
