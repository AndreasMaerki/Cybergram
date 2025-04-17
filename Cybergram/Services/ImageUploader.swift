import FirebaseStorage
import Foundation
import UIKit

enum ImageUploader {
  static func upload(image: UIImage) async throws -> String? {
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
    let uuid = UUID().uuidString
    let storageRef = Storage.storage().reference(withPath: "profile_image\(uuid)")

    do {
      _ = try await storageRef.putDataAsync(imageData)
      let url = try await storageRef.downloadURL()
      return url.absoluteString
    } catch {
      print("Error uploading image: \(error)")
      return nil
    }
  }
}
