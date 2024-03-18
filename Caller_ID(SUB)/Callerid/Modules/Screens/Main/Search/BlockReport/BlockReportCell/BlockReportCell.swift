import UIKit

final class BlockReportCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var containerImageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var busnView: UIView!
    @IBOutlet private weak var busnImageView: UIImageView!
    @IBOutlet private weak var busnTitle: UILabel!
    
    @IBOutlet private weak var personView: UIView!
    @IBOutlet private weak var personImageView: UIImageView!
    @IBOutlet private weak var personTitle: UILabel!
    
    private var selectedType = BetterNameSelectedType.bussines
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        setupvjnjenajsjsUI()
    }
}

//MARK: - Setup
private extension BlockReportCell {
    func setupvjnjenajsjsUI() {
        selectionStyle = .none
        containerImageView.layer.cornerRadius = containerImageView.frame.height / 2
        containerImageView.backgroundColor = .init(red: 232/255, green: 115/255, blue: 122/255, alpha: 0.2)
        
        titleLabel.textColor = .black
        subtitleLabel.text = "businnesTitle".localized()
        subtitleLabel.textColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        busnView.backgroundColor = .init(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        busnView.layer.cornerRadius = 10
        busnTitle.text = "business".localized()
        busnTitle.textColor = .lightGray
        let busnGesture = UITapGestureRecognizer(target: self, action: #selector(busnAction))
        busnView.addGestureRecognizer(busnGesture)
        
        personView.backgroundColor = .init(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        personView.layer.cornerRadius = 10
        personTitle.text = "personal".localized()
        personTitle.textColor = .lightGray
        let personGesture = UITapGestureRecognizer(target: self, action: #selector(personAction))
        personView.addGestureRecognizer(personGesture)
        updateButtons()
    }
    
    func updateButtons() {
        if selectedType == .bussines {
            busnImageView.image = #imageLiteral(resourceName: "checkBoxSelected")
            personImageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
        } else {
            busnImageView.image = #imageLiteral(resourceName: "checkBoxUnselected")
            personImageView.image = #imageLiteral(resourceName: "checkBoxSelected")
        }
    }
    
    @objc func busnAction() {
        selectedType = .bussines
        updateButtons()
    }
    
    @objc func personAction() {
        selectedType = .person
        updateButtons()
    }
}
