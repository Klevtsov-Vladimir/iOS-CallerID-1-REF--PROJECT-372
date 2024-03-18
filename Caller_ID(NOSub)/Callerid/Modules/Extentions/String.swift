import Foundation
import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var isValidName: Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedString.isEmpty {
            return false
        } else {
            return true
        }
    }
}
