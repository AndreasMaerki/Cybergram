import SwiftUI

struct CommentsView: View {
  @State private var commentText = ""
  @Environment(CommentsViewModel.self) private var viewModel
  @Environment(\.dismiss) var dismiss

  private var currentUser: User? {
    UserService.shared.currentUser
  }

  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(viewModel.comments) { comment in
            CommentCell(comment: comment)
          }
          .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
          .listRowSeparator(.hidden)
        }
        .listStyle(.plain)

        Divider()
          .padding(.top, -8)

        commentField
          .padding(.horizontal)
      }
      .navigationTitle(Text("Comments"))
      .navigationBarTitleDisplayMode(.inline)
    }
  }

  private var commentField: some View {
    HStack {
      CircularProfileImageView(user: currentUser, size: .xSmall)

      HStack {
        TextField("Add a comment", text: $commentText, axis: .vertical)
          .font(.footnote)
          .padding(12)

        postButton
          .padding(.trailing)
      }
      .overlay {
        Capsule()
          .stroke(Color(.systemGray5), lineWidth: 1)
      }
    }
  }

  private var postButton: some View {
    Button {
      Task {
        await uploadComment()
      }
    } label: {
      Text("Post")
        .font(.subheadline)
        .fontWeight(.semibold)
    }
    .disabled(commentText.isEmpty)
  }

  func uploadComment() async {
    do {
      try await viewModel.uploadComment(commentText)
      commentText = ""
    } catch {
      // TODO: Error handling
      print(error.localizedDescription)
    }
  }
}

#Preview {
  CommentsView()
    .environment(
      CommentsViewModel(
        post: .MOCK_POSTS[0],
        MockCommentService()
      )
    )
}
