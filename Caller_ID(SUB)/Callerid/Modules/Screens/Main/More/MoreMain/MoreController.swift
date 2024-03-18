import UIKit
import MessageUI

final class MoreController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }

        sduhbugvftcdrseawsrdtfyguhijhugyftdrxcftvgbyhnu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

//MARK: - Private methods
private extension MoreController {
    func getRowsInSection(section: Section) -> [Rows] {
        switch section {
        case .profile: return [.profile]
        case .premium: return [.premium]
        case .settings: return [.privacyCenter, .language]
//        case .support: return [.faq, .contactUs, .review]
//        case .about: return [.about]
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            composeVC.setToRecipients([email])
            composeVC.setSubject("")
            composeVC.setMessageBody("Enter your feedback", isHTML: false)
            self.present(composeVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Enable mail in settings", preferredStyle: .alert)
            
            let actionOk = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(actionOk)
            
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
            return
        }
    }
}

//MARK: - UITableViewDelegate
extension MoreController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = Section.allCases[section]
//        if section != .about {
            return 52
//        } else {
//            return 8
//        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = Section.allCases[section]
        var view = UIView()
        
//        if section != .about {
            view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 52))

            let label = UILabel(frame: CGRect(x: 0, y: 26 - 10, width: tableView.frame.width, height: 20))
            label.text = section.title
            label.font = .systemFont(ofSize: 18, weight: .medium)

            view.addSubview(label)
//        } else {
//            view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
//        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = Section.allCases[indexPath.section]
        let row = getRowsInSection(section: section)[indexPath.row]
        
        switch row {
        case .profile: return 64
        default: return 52
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = Section.allCases[indexPath.section]
        let row = getRowsInSection(section: sections)[indexPath.row]
        
        switch row {
        case .privacyCenter:
            let controller = PrivacyCenterController()
            navigationController?.pushViewController(controller, animated: true)
        case .language:
            DispatchQueue.main.async {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        case .faq:
            if let url = URL(string: faqUrl) {
                UIApplication.shared.open(url)
            }
        case .review:
            if let url = URL(string: reviewURL) {
                UIApplication.shared.open(url)
            }
        case .about:
            let controller = AboutController()
            navigationController?.pushViewController(controller, animated: true)
        case .contactUs:
            sendEmail()
        case .premium:
            let controller = ViewedProfileController()
            navigationController?.pushViewController(controller, animated: true)
        default: break
        }
    }
}

//MARK: - MFMailComposeViewControllerDelegate
extension MoreController: MFMailComposeViewControllerDelegate {
    func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource
extension MoreController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Section.allCases[section]
        return getRowsInSection(section: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section.allCases[indexPath.section]
        let row = getRowsInSection(section: section)[indexPath.row]
        
        switch row {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreProfileCell", for: indexPath) as? MoreProfileCell else { return UITableViewCell() }
            
            cell.titleLabel.text = "\(CorasedasadRddealm.shared.profileDB.first?.firstName ?? "") \(CorasedasadRddealm.shared.profileDB.first?.lastName ?? "")"
            cell.subtitleLabel.text = CorasedasadRddealm.shared.profileDB.first?.phone
            
            if !(CorasedasadRddealm.shared.profileDB.first?.avatarImage.isEmpty ?? false) {
                cell.profileImageView.image = UIImage(data: CorasedasadRddealm.shared.profileDB.first?.avatarImage ?? Data())
                cell.containerImageView.backgroundColor = .clear
            }
            
            cell.editCallback = {
                let controller = EditProfileController()
                controller.modalPresentationStyle = .fullScreen
                
                self.present(controller, animated: true)
            }
            
            return cell
        case .premium:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreBottomCell", for: indexPath) as? MoreBottomCell else { return UITableViewCell() }
            
            cell.leftImageView.image = row.leftImage
            cell.rightImageView.image = row.rightImage
            cell.titleLabel.text = row.title
            
            cell.layer.cornerRadius = 10
            cell.layer.addBorder(side: .all, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner])
            
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreBottomCell", for: indexPath) as? MoreBottomCell else { return UITableViewCell() }
            
            cell.leftImageView.image = row.leftImage
            cell.rightImageView.image = row.rightImage
            cell.titleLabel.text = row.title
            
            switch row {
            case .privacyCenter:
                cell.layer.cornerRadius = 10
                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor)
                cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            case .language:
                cell.layer.cornerRadius = 10
                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            case .faq:
                cell.layer.cornerRadius = 10
                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
                cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor)
                cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            case .contactUs:
                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor)
                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor)
            case .review:
                cell.layer.cornerRadius = 10
                cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor)
                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            case .about:
                cell.layer.cornerRadius = 10
                cell.layer.addBorder(side: .all, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner])
//                cell.layer.addBorder(side: .top, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
//                cell.layer.addBorder(side: .left, thickness: 1, color: UIColor.lightGray.cgColor)
//                cell.layer.addBorder(side: .right, thickness: 1, color: UIColor.lightGray.cgColor)
//                cell.layer.addBorder(side: .bottom, thickness: 1, color: UIColor.lightGray.cgColor, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            default: break
            }
            
            return cell
        }
    }
}

//MARK: - Setup
private extension MoreController {
    func sduhbugvftcdrseawsrdtfyguhijhugyftdrxcftvgbyhnu() {
        setupTable()
        
        titleLabel.text = "more".localized()
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30, weight: .medium)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MoreProfileCell", bundle: nil), forCellReuseIdentifier: "MoreProfileCell")
        tableView.register(UINib(nibName: "MoreBottomCell", bundle: nil), forCellReuseIdentifier: "MoreBottomCell")
    }
}

//MARK: - Enums
private extension MoreController {
    enum Section: Int, CaseIterable {
        case profile, premium, settings//, support, about
        
        var title: String? {
            switch self {
            case .profile: return "profile".localized()
            case .settings: return "settings".localized()
            case .premium: return "premium".localized()
//            case .support: return "support".localized()
//            case .about: return nil
            }
        }
    }
    
    enum Rows: Int, CaseIterable {
        case profile, premium, privacyCenter, language, faq, contactUs, review, about
        
        var title: String? {
            switch self {
            case .profile: return nil
            case .premium: return "premiumTitleSub".localized()
            case .privacyCenter: return "privacyCenter".localized()
            case .language: return "chooseLang".localized()
            case .faq: return "faq".localized()
            case .contactUs: return "contactUs".localized()
            case .review: return "writeRev".localized()
            case .about: return "about".localized()
            }
        }
        
        var leftImage: UIImage? {
            switch self {
            case .profile: return nil
            case .premium: return #imageLiteral(resourceName: "premiumLeftIm")
            case .privacyCenter: return #imageLiteral(resourceName: "privacyCenter")
            case .language: return #imageLiteral(resourceName: "language")
            case .faq: return #imageLiteral(resourceName: "faq")
            case .contactUs: return #imageLiteral(resourceName: "contactUs")
            case .review: return #imageLiteral(resourceName: "review")
            case .about: return #imageLiteral(resourceName: "about")
            }
        }
        
        var rightImage: UIImage? {
            switch self {
            case .profile: return nil
            case .premium: return #imageLiteral(resourceName: "arrowToRight")
            case .privacyCenter: return #imageLiteral(resourceName: "arrowToRight")
            case .language: return #imageLiteral(resourceName: "downloadRight")
            case .faq: return #imageLiteral(resourceName: "arrowToRight")
            case .contactUs: return #imageLiteral(resourceName: "arrowToRight")
            case .review: return #imageLiteral(resourceName: "downloadRight")
            case .about: return #imageLiteral(resourceName: "arrowToRight")
            }
        }
    }
}
