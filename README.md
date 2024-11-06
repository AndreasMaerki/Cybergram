# Instagram Clone - iOS App

An iOS app built using SwiftUI, Firebase, and Firebase Authentication that mimics the core features of Instagram. This app allows users to sign up, log in, upload images, and view posts in a feed. The project is designed as a learning tool for myself and is neither feature complete nor intended for production use.

## Features
- User Authentication: Sign up, log in, and log out using Firebase Authentication.
- User Profiles: Each user has a profile where they can upload a profile picture and view their posts.
- Photo Upload: Users can upload photos to Firebase Storage and view them in their profile or in the main feed.
- Feed: Users can view a feed of photos posted by others.
- Cloud Firestore: All user data, posts, and follow relations are stored in Firebase's Firestore database in real-time.


## Technologies Used
- SwiftUI: Modern UI framework for building the user interface.
- Firebase:
  - Authentication: For user sign-up, login, and session management.
  - Firestore: For storing user data, posts, and follow relationships.
  - Firebase Storage: For storing uploaded images.
 
## Firebase
The GoogleService-Info.plist file is not included in this repository to prevent leaking sensitive information. You must generate your own GoogleService-Info.plist file by following the Firebase setup instructions mentioned below.
### Download the GoogleService-Info.plist:
- In the Firebase Console, go to Project Settings.
- Under Your Apps, add an iOS app to your Firebase project.
- Follow the setup instructions and download the GoogleService-Info.plist file.
- Important: Do not share or commit this file to version control.

## Add GoogleService-Info.plist to Xcode:
- Download the GoogleService-Info.plist from Firebase and add it to the root of your Xcode project by dragging it into the Xcode file navigator.
- Ensure that it is included in the app's target.

