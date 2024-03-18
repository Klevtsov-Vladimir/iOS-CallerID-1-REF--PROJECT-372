import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        for i in 0...100 {
            print(i)
        }
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
