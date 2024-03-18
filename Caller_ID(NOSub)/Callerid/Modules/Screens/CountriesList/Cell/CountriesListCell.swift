import UIKit

final class CountriesListCell: UITableViewCell {
    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tyygfwsetupdcdcdvgggUI()
    }
}

//MARK: - Open methods
extension CountriesListCell {
    func seastasdaImasadge(_ image: UIImage) {
        countryImageView.image = image
    }
    
    func sasdetTaseassasaxt(_ text: String) {
        countryLabel.text = text
    }
}

//MARK: - Setup
private extension CountriesListCell {
    func tyygfwsetupdcdcdvgggUI() {
        self.selectionStyle = .none
    }
}
