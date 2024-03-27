import UIKit

final class FunctionsView: NibDesignable {
 
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet var backView: UIView!
    
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
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 32
        backView.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                            shadowOffset: CGSize(width: 0, height: 0),
                            shadowRadius: 6.1,
                            shadowOpacity: 0.7)
       
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true

        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedAction))
        imageView.addGestureRecognizer(gesture)
    }
}
