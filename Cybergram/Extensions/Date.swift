import Foundation

extension Date {
  func timestampString() -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.weekOfMonth, .day, .hour, .minute, .second]
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    return formatter.string(from: self, to: Date()) ?? ""
  }
}
