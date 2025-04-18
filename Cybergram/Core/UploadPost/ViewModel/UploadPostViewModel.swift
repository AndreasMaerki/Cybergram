import _PhotosUI_SwiftUI
import Firebase
import Foundation
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
  @Published var selectedPhoto: PhotosPickerItem? {
    didSet {
      Task {
        await loadImage(fromItem: selectedPhoto)
      }
    }
  }

  @Published var postPhoto: Image?
  private var uiImage: UIImage?

  func loadImage(fromItem item: PhotosPickerItem?) async {
    guard
      let item,
      let data = try? await item.loadTransferable(type: Data.self),
      let uiImage = UIImage(data: data)
    else { return }
    self.uiImage = uiImage
    postPhoto = Image(uiImage: uiImage)
  }

  func uploadPost(caption: String) async throws {
    guard
      let uid = Auth.auth().currentUser?.uid,
      let uiImage,
      let imageUrl = try await ImageUploader.upload(image: uiImage)
    else {
      return
    }

    let postRef = Firestore.firestore().collection("posts").document()

    let post = Post(
      id: postRef.documentID,
      ownerUid: uid,
      caption: caption,
      likes: 0,
      imageUrl: imageUrl,
      timestamp: Date(),
      user: nil
    )

    guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
    try await postRef.setData(encodedPost)
  }
}
