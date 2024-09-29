//
//  ImageUploader.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 28.09.2024.
//

import Foundation
import UIKit
import FirebaseStorage

struct ImageUploader {
  static func upload(image: UIImage) async throws -> String? {
    guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
    let uuid = UUID().uuidString
    let storageRef = Storage.storage().reference(withPath: "profile_image\(uuid)")

    do {
      let _ = try await storageRef.putDataAsync(imageData)
      let url = try await storageRef.downloadURL()
      return url.absoluteString
    } catch {
      print("Error uploading image: \(error)")
      return nil
    }
  }
}
