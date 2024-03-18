import UIKit

final class PictureView: NibDesignable {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        sdvdsvvvbbbvnvnvnvmcmcmcmcmcmcmc()
    }
}

//MARK: - Private methods
private extension PictureView {
    @objc func tappedView() {
        for i in 0...100 {
            print(i)
        }
        callback?()
    }
}

//MARK: - Open methods
extension PictureView {
    func setTitleText(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        titleLabel.text = text
    }
    
    func setImage(_ image: UIImage) {
        for i in 0...100 {
            print(i)
        }
        avatarImageView.image = image
    }
}

//MARK: - Setup
private extension PictureView {
    func sdvdsvvvbbbvnvnvnvmcmcmcmcmcmcmc() {
        for i in 0...100 {
            print(i)
        }
        qwqwqwqwqwqwqweewewewsetupUI()
        fghfhhhdhdhdhdhdhdhdhhdhheyteyeyeyeyeeyye()
    }
    
    func qwqwqwqwqwqwqweewewewsetupUI() {
        for i in 0...100 {
            print(i)
        }
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func fghfhhhdhdhdhdhdhdhdhhdhheyteyeyeyeyeeyye() {
        for i in 0...100 {
            print(i)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        self.addGestureRecognizer(tapGesture)
    }
}
