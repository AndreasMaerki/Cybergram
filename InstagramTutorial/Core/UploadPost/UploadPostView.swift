//
//  UploadPostView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 13.06.2024.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
  @State private var caption = ""
  @State private var isPhotosPickerPresented = false
  @StateObject var viewModel = UploadPostViewmodel()
  @Binding var tabIndex: Int
  
  var body: some View {
    VStack {
      // action tool bar
      HStack {
        Button {
          caption = ""
          viewModel.postPhoto = nil
          viewModel.selectedPhoto = nil
          tabIndex = 0
        } label: {
          Text("Cancel")
        }
        
        Spacer()
        
        Text("New Post")
          .fontWeight(.semibold)
        
        Spacer()
        
        Button {
          print("upload")
        } label: {
          Text("Upload")
            .fontWeight(.semibold)
        }
      }
      .padding(.horizontal)
      
      // post image and caption
      HStack(spacing: 8) {
        if let image = viewModel.postPhoto {
          image
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
        }
        
        TextField("Your caption...", text: $caption, axis: .vertical)
      }
      .padding()
      Spacer()
    }
    .onAppear {
      isPhotosPickerPresented.toggle()
    }
    .photosPicker(
      isPresented: $isPhotosPickerPresented,
      selection: $viewModel.selectedPhoto
    )
  }
}

#Preview {
  UploadPostView(tabIndex: .constant(1))
}
