import UIKit

final class FunctionsView: NibDesignable {
    @IBOutlet private weak var containerImageView: UIView!
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

//MARK: - Private methods
private extension FunctionsView {
    @objc func tappedAction() {
        callback?()
    }
}

//MARK: - Setup
private extension FunctionsView {
    func setupUI() {
        containerImageView.layer.cornerRadius = 8
        containerImageView.layer.borderColor = UIColor.init(red: 178/255, green: 178/255, blue: 178/255, alpha: 1).cgColor
        containerImageView.layer.borderWidth = 1
        
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedAction))
        containerImageView.addGestureRecognizer(gesture)
    }
}
