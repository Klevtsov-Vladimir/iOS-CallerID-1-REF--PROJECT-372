import UIKit
import GoogleMobileAds

final class PhoneBannerCell: UITableViewCell {
    @IBOutlet private weak var bannerView: GADBannerView!
    
//    private var banner: GADBannerView?
    
    lazy var rootController = UIViewController() {
        didSet {
            setupBanner()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
}

//MARK: - Setup
private extension PhoneBannerCell {
    func setupBanner() {
//        banner = GADBannerView(adSize: GADAdSizeBanner)
        bannerView?.adUnitID = bannerKey
        bannerView?.rootViewController = rootController
        bannerView?.load(GADRequest())
        
//        bannerView.addSubview(banner ?? GADBannerView())
//        banner?.center = bannerView.center
    }
}
