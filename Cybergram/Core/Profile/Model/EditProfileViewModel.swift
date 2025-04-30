import _PhotosUI_SwiftUI
import Firebase
import SwiftUI

@Observable
@MainActor
class EditProfileViewModel {
  var user: User
  var fullName = ""
  var bio = ""
  var profileImage: Image?
  var selectedImage: PhotosPickerItem? {
    didSet {
      Task {
        await loadImage(fromItem: selectedImage)
      }
    }
  }

  private var uiImage: UIImage?

  init(user: User) {
    self.user = user

    if let fullName = user.fullName {
      self.fullName = fullName
    }

    if let bio = user.bio {
      self.bio = bio
    }
  }

  func loadImage(fromItem item: PhotosPickerItem?) async {
    guard
      let item,
      let data = try? await item.loadTransferable(type: Data.self),
      let uiImage = UIImage(data: data)
    else { return }
    self.uiImage = uiImage
    profileImage = Image(uiImage: uiImage)
  }

  func updateUserData() async throws {
    var data = [String: Any]()

    if let uiImage {
      let imageUrl = try? await ImageUploader.upload(image: uiImage)
      data["profileImageUrl"] = imageUrl
    }

    if !fullName.isEmpty, fullName != user.fullName {
      data["fullName"] = fullName
    }

    if !bio.isEmpty, bio != user.bio {
      data["bio"] = bio
    }

    if !data.isEmpty {
      try await FirConstants.userCollection.document(user.id).updateData(data)
      // user data is not expected to be updated frequently
      // so the roundtrip doesn't cost much. Alternatively the
      // user could be updated in place.
      try await UserService.shared.fetchCurrentUser()
    }
  }
}
