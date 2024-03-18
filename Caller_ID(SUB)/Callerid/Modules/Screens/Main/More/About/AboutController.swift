import UIKit

final class AboutController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        for i in 0...100 {
            print(i)
        }
        setdsdcup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for i in 0...100 {
            print(i)
        }

        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: - Actions
private extension AboutController {
    @IBAction func bacssckAssction(_ sender: Any) {
        for i in 0...100 {
            print(i)
        }
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Private methods
private extension AboutController {
    func getRowsInSection(section: Sections) -> [Rows] {
        switch section {
        case .info: return [.version]
        case .follow: return [.insta, .twitter, .facebook, .youtube]
        case .callerId: return [.blog, .website]
        case .help: return [.terms, .policy]
        }
    }
}

//MARK: - UITableViewDelegate
extension AboutController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = Sections.allCases[section]
        var view = UIView()
        
        view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 52))
        
        let label = UILabel(frame: CGRect(x: 0, y: 26 - 10, width: tableView.frame.width, height: 20))
        label.text = section.title
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = Sections.allCases[indexPath.section]
        let row = getRowsInSection(section: section)[indexPath.row]
        
        switch row {
        case .insta:
            if let url = URL(string: "instagram://user?username=\(instagramName)") {
                UIApplication.shared.open(url)
            }
        case .twitter:
            if let url = URL(string: "twitter://user?screen_name=\(twitterName)") {
                UIApplication.shared.open(url)
            }
        case .facebook:
            if let url = URL(string: "fb://profile/\(twitterName)") {
                UIApplication.shared.open(url)
            }
        case .youtube:
            if let url = URL(string: "youtube://www.youtube.com/user/\(youtubeName)") {
                UIApplication.shared.open(url)
            }
        case .blog:
            if let url = URL(string: "https://google.com/search?q=\(blogName)") {
                UIApplication.shared.open(url)
            }
        case .website:
            if let url = URL(string: "https://google.com/search?q=\(websiteName)") {
                UIApplication.shared.open(url)
            }
        case .terms:
            if let url = URL(string: termsLink) {
                UIApplication.shared.open(url)
            }
        case .policy:
            if let url = URL(string: privacyLink) {
                UIApplication.shared.open(url)
            }
        default: break
        }
    }
}

//MARK: -
extension AboutController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Sections.allCases[section]
        let rows = getRowsInSection(section: section)
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath) as? AboutCell else { return UITableViewCell() }
        let section = Sections.allCases[indexPath.section]
        let row = getRowsInSection(section: section)[indexPath.row]
        
        cell.titleLabel.text = row.title
        cell.rightImageView.image = row.rightImage
        if row == .version {
            cell.rightImageView.isHidden = true
        } else {
            cell.rightImageView.isHidden = false
        }
        cell.rightLabel.text = row.rightText
        
        switch row {
        case .version:
            cell.layer.cornerRadius = 10
            cell.layer.addBorder(side: .all, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner])
        case .insta, .blog, .terms:
            cell.layer.cornerRadius = 10
            cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor)
            cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        case .twitter:
            cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor)
            cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor)
            cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor)
        case .facebook:
            cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor)
            cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor)
        case .youtube:
            cell.layer.cornerRadius = 10
            cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor)
            cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        case .website, .policy:
            cell.layer.cornerRadius = 10
            cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            //        case .terms:
            //        case .policy:
        }
        
        return cell
    }
}

//MARK: - Setup
private extension AboutController {
    func setdsdcup() {
        setupTable()
        
        titleLabel.text = "about".localized()
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AboutCell", bundle: nil), forCellReuseIdentifier: "AboutCell")
    }
}

//MARK: - Enums
private extension AboutController {
    enum Sections: Int, CaseIterable {
        case info, follow, callerId, help
        
        var title: String {
            switch self {
            case .info: return "info".localized()
            case .follow: return "followUs".localized()
            case .callerId: return "callerId".localized()
            case .help: return "help".localized()
            }
        }
    }
    
    enum Rows: Int, CaseIterable {
        case version, insta, twitter, facebook, youtube, blog, website, terms, policy
        
        var title: String {
            switch self {
            case .version: return "version".localized()
            case .insta: return "insta".localized()
            case .twitter: return "twitter".localized()
            case .facebook: return "facebook".localized()
            case .youtube: return "youtube".localized()
            case .blog: return "blog".localized()
            case .website: return "website".localized()
            case .terms: return "terms".localized()
            case .policy: return "privacy".localized()
            }
        }
        
        var rightText: String? {
            switch self {
            case .version: return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
            case .insta: return instagramName
            case .twitter: return twitterName
            case .facebook: return facebookName
            case .youtube: return youtubeName
            case .blog: return blogName
            case .website: return websiteName
            default: return nil
            }
        }
        
        var rightImage: UIImage? {
            switch self {
            case .version: return nil
            default: return  #imageLiteral(resourceName: "arrowToRight")
            }
        }
    }
}
