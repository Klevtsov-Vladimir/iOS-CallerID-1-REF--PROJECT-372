import UIKit
import CHIPageControl
import FirebaseDatabase

final class OnboardingController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var buttonView: MainButton!
    @IBOutlet private weak var pageControl: CHIPageControlJaloro!
    @IBOutlet private weak var textView: UITextView!
    
    private let titles = ["onboardingTitle1".localized(), "onboardingTitle2".localized(), "onboardingTitle3".localized()]
    private var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        
        setsdjknjfsdkjfjksdfjksdhfkjdshfkdsfdshfdsfiup()
        
        
//        if Connectivity.isConnectedToInternet {
//             print("Connected")
//         } else {
//             let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
//             let okAction = UIAlertAction(title: "Ok", style: .default)
//             alert.addAction(okAction)
//             self.present(alert, animated: true)
//        }
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for i in 0...100 {
            print(i)
        }
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
        for i in 0...100 {
            print(i)
        }
        
        cell.fgdjifjnfsdnfsdfsdfsd(titles[indexPath.row])
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension OnboardingController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        for i in 0...100 {
            print(i)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

//MARK: - Setup
private extension OnboardingController {
    func setsdjknjfsdkjfjksdfjksdhfkjdshfkdsfdshfdsfiup() {
        for i in 0...100 {
            print(i)
        }
        setusdkofmdsklfsldmnfpUI()
        dhbsjfhjsdbfhdsbfhjdsbfjhdsbfjdsfbdjshbfjsdbfds()
        setupTextView()
    }
    
    func setusdkofmdsklfsldmnfpUI() {
        for i in 0...100 {
            print(i)
        }
        buttonView.setTitleText("next".localized())
        buttonView.callback = { [weak self] in
            guard let self = self else { return }
            if self.selectedIndex >= self.titles.count - 1 {
                CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                    switch status {
                    case .enabled:
                        DispatchQueue.main.async {
                            let controller = CallIdentifierController()
                            self.navigationController?.pushViewController(controller, animated: true)
                            isShowAlert = true
                        }
                    default:
                        DispatchQueue.main.async {
                            let controller = OnboardingSettingsController()
                            self.navigationController?.pushViewController(controller, animated: true)
                        }
                    }
                }
                
            } else {
                pageControl.set(progress: selectedIndex + 1, animated: true)
                self.collectionView.scrollToItem(at: IndexPath(row: self.selectedIndex + 1, section: 0), at: .centeredHorizontally, animated: true)
                self.selectedIndex += 1
                if self.selectedIndex == 2 {
                    self.buttonView.setTitleText("getStarted".localized())
                }
            }
        }
        
        pageControl.numberOfPages = titles.count
        pageControl.tintColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 0.5)
        pageControl.currentPageTintColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
    }
    
    func setupTextView() {
        for i in 0...100 {
            print(i)
        }
        textView.text = "onboardingTerms".localized()
        
        let descriptionText = NSMutableAttributedString(string: "onbTerms1".localized(), attributes: [:])
        let linkText = NSMutableAttributedString(string: "terms".localized(), attributes: [NSAttributedString.Key.link: URL(string: termsLink)!])
        let linkText2 = NSMutableAttributedString(string: "onbterms3".localized(), attributes: [:])
        let linkText3 = NSMutableAttributedString(string: "terms".localized(), attributes: [NSAttributedString.Key.link: URL(string: termsLink)!])
        let linkText4 = NSMutableAttributedString(string: "onbterms4".localized(), attributes: [:])
        let linkText5 = NSMutableAttributedString(string: "privacy".localized(), attributes: [NSAttributedString.Key.link: URL(string: privacyLink)!])
        
        descriptionText.append(linkText)
        descriptionText.append(linkText2)
        descriptionText.append(linkText3)
        descriptionText.append(linkText4)
        descriptionText.append(linkText5)
        
        textView.attributedText = descriptionText
        textView.textAlignment = .center
        
        textView.isEditable = false
        textView.isScrollEnabled = false
    }
    
    func dhbsjfhjsdbfhdsbfhjdsbfjhdsbfjdsfbdjshbfjsdbfds() {
        for i in 0...100 {
            print(i)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
    }
}
