import UIKit

final class MoreDataController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

//MARK: - Actions
private extension MoreDataController {
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Private methods
private extension MoreDataController {
    func shareDate() {
        var dictonary : [String : Any] = [
            "profile": [
                "firstName": CorasedasadRddealm.shared.profileDB.first?.firstName,
                "lastName": CorasedasadRddealm.shared.profileDB.first?.lastName,
                "email": CorasedasadRddealm.shared.profileDB.first?.email,
                "gender": CorasedasadRddealm.shared.profileDB.first?.gender,
                "phone": CorasedasadRddealm.shared.profileDB.first?.phone,
                "website": CorasedasadRddealm.shared.profileDB.first?.website,
                "job": CorasedasadRddealm.shared.profileDB.first?.job,
                "street": CorasedasadRddealm.shared.profileDB.first?.street,
                "zip": CorasedasadRddealm.shared.profileDB.first?.zip,
                "city": CorasedasadRddealm.shared.profileDB.first?.city,
                "country": CorasedasadRddealm.shared.profileDB.first?.country,
                "company": CorasedasadRddealm.shared.profileDB.first?.company
            ]
        ]
        
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) {
            DispatchQueue.main.async {
                let encoder = JSONEncoder()
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    var documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    let file2ShareURL = documentsDirectoryURL.appendingPathComponent("profile.json")
                    do {
                        try jsonString.write(to: file2ShareURL, atomically: false, encoding: .utf8)
                    } catch {
                        print(error)
                    }
                    
                    do {
                        let _ = try Data(contentsOf: file2ShareURL)
                        let activityViewController = UIActivityViewController(activityItems: [file2ShareURL], applicationActivities: nil)
//                        activityViewController.popoverPresentationController?.sourceRect = self.view.frame
                        activityViewController.popoverPresentationController?.sourceView = self.view
                        
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            activityViewController.excludedActivityTypes = []
                            activityViewController.popoverPresentationController?.sourceView = self.view
                            
                            let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? PrivacyCell
                            let newFrame = CGRect(
                                x: cell?.contentView.frame.origin.x ?? 0,
                                y: (cell?.contentView.frame.origin.y ?? 0) + 140,
                                width: cell?.contentView.frame.width ?? 0,
                                height: cell?.contentView.frame.height ?? 0
                            )
                            
                            activityViewController.popoverPresentationController?.sourceRect = newFrame
                            self.present(activityViewController, animated: true, completion: nil)
                        } else {
                            self.present(activityViewController, animated: true, completion: nil)
                        }
                        
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension MoreDataController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Rows.allCases[indexPath.row]
        
        switch row {
        case .rectify:
            let controller = EditProfileController()
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        case .download: shareDate()
        }
    }
}

//MARK: - UITableViewDataSource
extension MoreDataController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyCell", for: indexPath) as? PrivacyCell else { return UITableViewCell() }
        let row = Rows.allCases[indexPath.row]
        
        cell.titleLabel.text = row.title
        
        return cell
    }
}

//MARK: - Setup
private extension MoreDataController {
    func setup() {
        setupTable()
        
        navigationController?.navigationBar.isHidden = true
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.text = "privacyData".localized().uppercased()
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PrivacyCell", bundle: nil), forCellReuseIdentifier: "PrivacyCell")
    }
}

//MARK: - Enums
private extension MoreDataController {
    enum Rows: Int, CaseIterable {
        case rectify, download
        
        var title: String {
            switch self {
            case .rectify: return "restifyData".localized()
            case .download: return "downloadData".localized()
            }
        }
    }
}
