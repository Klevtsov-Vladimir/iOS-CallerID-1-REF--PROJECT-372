import UIKit
import FirebaseDatabase
import FirebaseStorage

final class ViewedProfileController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewedInfo = ViewedInfo()
    
    private let reference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sfsdffbbbtbbtbtbtbttbbtbtbttbtbttggtgtgt()
    }
}

//MARK: - Actions
private extension ViewedProfileController {
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension ViewedProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

//MARK: - UITableViewDataSource
extension ViewedProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewedInfo.arrayNum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViewedProfileCell", for: indexPath) as? ViewedProfileCell else { return UITableViewCell() }
        
        if viewedInfo.arrayFName.count != viewedInfo.arrayNum.count {
            cell.titleLabel.text = viewedInfo.arrayNum[indexPath.row]
        } else {
            let name = viewedInfo.arrayFName[indexPath.row] + viewedInfo.arrayLName[indexPath.row]
            if !name.isEmpty {
                cell.titleLabel.text = viewedInfo.arrayFName[indexPath.row] + " " + viewedInfo.arrayLName[indexPath.row]
            } else {
                cell.titleLabel.text = viewedInfo.arrayNum[indexPath.row]
            }
        }
        

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        let dateString = dayTimePeriodFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(viewedInfo.date[indexPath.row]) ?? 0))
        
        cell.subtitleLabel.text = dateString
        
        return cell
    }
}

//MARK: - Setup
private extension ViewedProfileController {
    func sfsdffbbbtbbtbtbtbttbbtbtbttbtbttggtgtgt() {
        setpoiurtyuikjmnhbvgupUI()
        featchFirebase()
    }
    
    func setpoiurtyuikjmnhbvgupUI() {
        titleLabel.text = "premiumTitleSub".localized().uppercased()
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    func featchFirebase() {
//        if UIDevice.current.userInterfaceIdiom == .phone {
            reference.child("users").child(UserDefaults.standard.string(forKey: "phone") ?? "").observeSingleEvent(of: .value) { [weak self] snapshot in
                if snapshot.hasChild("viewedPhones") {
                    if let dic = snapshot.value as? [String : Any] {
    //                    DispatchQueue.main.async {
                            self?.viewedInfo.arrayNum = (dic["viewedPhones"] as? [String]) ?? []
                            
    //                        self?.tableView.reloadData()
    //                    }
                    }
                }
                
                if snapshot.hasChild("viewedDate") {
                    if let dic = snapshot.value as? [String : Any] {
    //                    DispatchQueue.main.async {
                            self?.viewedInfo.date = (dic["viewedDate"] as? [String]) ?? []
                            
    //                        self?.tableView.reloadData()
    //                    }
                    }
                }
                
                if snapshot.hasChild("firstNameArr") {
                    if let dic = snapshot.value as? [String : Any] {
    //                    DispatchQueue.main.async {
                            self?.viewedInfo.arrayFName = (dic["firstNameArr"] as? [String]) ?? []
                            
    //                        self?.tableView.reloadData()
    //                    }
                    }
                }
                
                if snapshot.hasChild("lastNameArr") {
                    if let dic = snapshot.value as? [String : Any] {
                        self?.viewedInfo.arrayLName = (dic["lastNameArr"] as? [String]) ?? []
                        
                    }
                }
                
                DispatchQueue.main.async {
                    self?.setupTable()
                    self?.tableView.reloadData()
                }
            }
        
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ViewedProfileCell", bundle: nil), forCellReuseIdentifier: "ViewedProfileCell")
    }
}

struct ViewedInfo {
    var arrayNum = [String]()
    var date = [String]()
    var arrayFName = [String]()
    var arrayLName = [String]()
}

