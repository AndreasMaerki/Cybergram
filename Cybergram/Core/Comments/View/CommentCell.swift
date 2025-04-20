import SwiftUI

struct CommentCell: View {
  let comment: Comment
  var body: some View {
    HStack {
      CircularProfileImageView(user: comment.user, size: .xSmall)
      VStack(alignment: .leading, spacing: 4.0) {
        HStack(alignment: .bottom, spacing: 4.0) {
          Text(comment.user?.userName ?? "")
            .fontWeight(.semibold)
          Text("6d")
            .foregroundStyle(.secondary)
        }
        Text(comment.text)
      }
      .font(.caption)
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  CommentCell(comment: .MOCK)
}
