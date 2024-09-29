//
//  UploadPostViewmodel.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 14.06.2024.
//

import _PhotosUI_SwiftUI
import Foundation
import SwiftUI

@MainActor
class UploadPostViewmodel: ObservableObject {
  @Published var selectedPhoto: PhotosPickerItem? {
    didSet {
      Task {
        await loadImage(fromItem: selectedPhoto)
      }
    }
  }
  
  @Published var postPhoto: Image?
  
  func loadImage(fromItem item: PhotosPickerItem?) async {
    guard
      let item = item,
      let data = try? await item.loadTransferable(type: Data.self),
      let uiImage = UIImage(data: data)
    else { return }

    postPhoto = Image(uiImage: uiImage)
  }
}
