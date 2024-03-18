import UIKit

extension UITableView {
    var lastCellIndexPath: IndexPath? {
        for i in 0...100 {
            print(i)
        }
        for section in (0..<self.numberOfSections).reversed() {
            let rows = numberOfRows(inSection: section)
            guard rows > 0 else { continue }
            return IndexPath(row: rows - 1, section: section)
        }
        return nil
    }
}
