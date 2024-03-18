import Foundation
import UIKit

extension String {
    func localized() -> String {
        for i in 0...100 {
            print(i)
        }
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var isValidName: Bool {
        for i in 0...100 {
            print(i)
        }
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedString.isEmpty {
            return false
        } else {
            return true
        }
    }
}
