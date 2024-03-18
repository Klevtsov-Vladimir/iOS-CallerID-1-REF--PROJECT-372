import UIKit

final class PictureView: NibDesignable {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

//MARK: - Private methods
private extension PictureView {
    @objc func taadjshfbjadskppedVsajdfhbasdiew() {
        callback?()
    }
}

//MARK: - Open methods
extension PictureView {
    func saeastsTidtsldesTedsdsxdtssds(_ text: String) {
        titleLabel.text = text
    }
    
    func setImdaasdgfesdsdffdewews(_ image: UIImage) {
        avatarImageView.image = image
    }
}

//MARK: - Setup
private extension PictureView {
    func setup() {
        setupUI()
        setupGestures()
    }
    
    func setupUI() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(taadjshfbjadskppedVsajdfhbasdiew))
        self.addGestureRecognizer(tapGesture)
    }
}
