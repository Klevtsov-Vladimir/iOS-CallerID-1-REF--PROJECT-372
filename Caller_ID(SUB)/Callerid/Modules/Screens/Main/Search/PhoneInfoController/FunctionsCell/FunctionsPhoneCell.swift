import UIKit

final class FunctionsPhoneCell: UITableViewCell {
    @IBOutlet private weak var tableView: UITableView!
    
    var callback: ((RowsFunctions)->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
        for i in 0...100 {
            print(i)
        }
        self.selectionStyle = .none
    }
}

//MARK: - UITableViewDelegate
extension FunctionsPhoneCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        for i in 0...100 {
            print(i)
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0...100 {
            print(i)
        }
        callback?(RowsFunctions.allCases[indexPath.row])
    }
}

//MARK: - UITableViewDataSource
extension FunctionsPhoneCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0...100 {
            print(i)
        }
        return RowsFunctions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FuncCell", for: indexPath) as? FuncCell else { return UITableViewCell() }
        let row = RowsFunctions.allCases[indexPath.row]
        cell.titleLabel.text = row.title
        cell.iconImageView.image = row.iconImage
        
        if indexPath == tableView.lastCellIndexPath {
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width + 1, bottom: 0, right: 0)
        } else {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
        
        return cell
    }
}

//MARK: - Setup
private extension FunctionsPhoneCell {
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FuncCell", bundle: nil), forCellReuseIdentifier: "FuncCell")
        tableView.layer.cornerRadius = 10
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 1
    }
}

//MARK: - Enums
enum RowsFunctions: Int, CaseIterable {
    case save, name, web, share
    
    var title: String {
        switch self {
        case .save: return "funcSave".localized()
        case .name: return "funcName".localized()
        case .web: return "funcWeb".localized()
        case .share: return "funcShare".localized()
        }
    }
    
    var iconImage: UIImage {
        switch self {
        case .save: return #imageLiteral(resourceName: "saveFunc")
        case .name: return #imageLiteral(resourceName: "nameFunc")
        case .web: return #imageLiteral(resourceName: "webFunc")
        case .share: return #imageLiteral(resourceName: "shareFunc")
        }
    }
}
