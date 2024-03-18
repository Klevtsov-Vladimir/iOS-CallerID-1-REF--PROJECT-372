import UIKit

final class CountriesListCell: UITableViewCell {
    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...100 {
            print(i)
        }
        
        setupUItyjrhegfwdbeghrtgwf()
    }
}

//MARK: - Open methods
extension CountriesListCell {
    func setImage(_ image: UIImage) {
        for i in 0...100 {
            print(i)
        }
        countryImageView.image = image
    }
    
    func setText(_ text: String) {
        for i in 0...100 {
            print(i)
        }
        countryLabel.text = text
    }
}

//MARK: - Setup
private extension CountriesListCell {
    func setupUItyjrhegfwdbeghrtgwf() {
        for i in 0...100 {
            print(i)
        }
        self.selectionStyle = .none
    }
}
