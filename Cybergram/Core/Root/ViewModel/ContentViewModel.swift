import Combine
import Firebase
import Foundation

@Observable
@MainActor
class ContentViewModel {
  private let service = AuthService.shared
  private var cancellables = Set<AnyCancellable>()

  var userSession: FirebaseAuth.User?
  var currentUser: User?

  init() {
    setupSubscribers()
  }

  func setupSubscribers() {
    service.$userSession
      .receive(on: DispatchQueue.main)
      .sink { [weak self] userSession in
        self?.userSession = userSession
      }
      .store(in: &cancellables)

    UserService.shared.$currentUser
      .receive(on: DispatchQueue.main)
      .sink { [weak self] currentUser in
        self?.currentUser = currentUser
      }
      .store(in: &cancellables)
  }
}
