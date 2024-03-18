import UIKit

final class EditImageCell: UITableViewCell {
    @IBOutlet private(set) weak var containerImageView: UIView!
    @IBOutlet private(set) weak var avatarImageView: UIImageView!
    
//    var viewTapped: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        
        self.selectionStyle = .none
        containerImageView.layer.cornerRadius = containerImageView.frame.height / 2
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.contentMode = .scaleAspectFill
        
//        let ges = UITapGestureRecognizer(target: self, action: #selector(viewVTapped))
//        containerImageView.addGestureRecognizer(ges)
    }
    
    @objc func viewVTapped() {
//        viewTapped?()
    }
}
