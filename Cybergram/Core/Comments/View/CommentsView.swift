import SwiftUI

struct CommentsView: View {
  @State private var commentText = ""

  var body: some View {
    NavigationStack {
      VStack {
        List {
          ForEach(0 ..< 20) { _ in
            CommentCell()
          }
          .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
          .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        Divider()
          .padding(.top, -8)

        HStack {
          CircularProfileImageView(user: User.MOCK_USERS[0], size: .xSmall)

          HStack {
            TextField("Add a comment", text: $commentText, axis: .vertical)
              .font(.footnote)
              .padding(12)

            Button {
              // post
            } label: {
              Text("Post")
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            .padding(.trailing)
          }
          .overlay {
            Capsule()
              .stroke(Color(.systemGray5), lineWidth: 1)
          }
        }.padding(.horizontal)
      }
      .navigationTitle(Text("Comments"))
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  CommentsView()
}
