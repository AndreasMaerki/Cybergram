import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct InstagramTutorialApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      ContentView(
        searchViewModel: SearchViewModel(),
        feedViewModel: FeedViewModel()
      )
    }
  }
}
