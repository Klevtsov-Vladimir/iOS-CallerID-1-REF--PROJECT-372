import UIKit
import CHIPageControl
import FirebaseDatabase

final class OnboardingController: UIViewController {
    
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var subButton: UIButton!
    
    @IBAction func tapMain(_ sender: Any) {
        let controller = CallIdentifierController()
        self.navigationController?.pushViewController(controller, animated: true)
        isShowAlert = true
    }
    
    @IBAction func tapSub(_ sender: Any) {
    }
    
    private let titles = ["onboardingTitle1".localized(), "onboardingTitle2".localized(), "onboardingTitle3".localized()]
    private var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addGradient(colors: [UIColor(named: "bg1stColor") ?? .clear, UIColor(named: "bg2ndColor") ?? .clear],
                         startPoint: CGPoint(x: 0.5, y: 0),
                         endPoint: CGPoint(x: 0.5, y: 1))
    }
    
}

//MARK: - UICollectionViewDataSource
//extension OnboardingController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return titles.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
//
//        cell.setTitleText(titles[indexPath.row])
//
//        return cell
//    }
//}

//MARK: - UICollectionViewDelegate


//MARK: - UICollectionViewDelegateFlowLayout
//extension OnboardingController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//}

//MARK: - Setup
private extension OnboardingController {
    func setup() {
        //        setupsdfsdfsdfsdcUI()
        setupCollection()
        setupTextView()
    }
    
    //    func setupsdfsdfsdfsdcUI() {
    //        buttonView.setTitleText("next".localized())
    //        buttonView.callback = { [weak self] in
    //            guard let self = self else { return }
    //            if self.selectedIndex >= self.titles.count - 1 {
    //                CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
    //                    switch status {
    //                    case .enabled:
    //                        DispatchQueue.main.async {
    //                            let controller = CallIdentifierController()
    //                            self.navigationController?.pushViewController(controller, animated: true)
    //                            isShowAlert = true
    //                        }
    //                    default:
    //                        DispatchQueue.main.async {
    //                            let controller = OnboardingSettingsController()
    //                            self.navigationController?.pushViewController(controller, animated: true)
    //                        }
    //                    }
    //                }
    //
    //            } else {
    //                pageControl.set(progress: selectedIndex + 1, animated: true)
    //                self.collectionView.scrollToItem(at: IndexPath(row: self.selectedIndex + 1, section: 0), at: .centeredHorizontally, animated: true)
    //                self.selectedIndex += 1
    //                if self.selectedIndex == 2 {
    //                    self.buttonView.setTitleText("getStarted".localized())
    //                }
    //            }
    //        }
    //
    //        pageControl.numberOfPages = titles.count
    //        pageControl.tintColor = .init(red: 178/255, green: 178/255, blue: 178/255, alpha: 0.5)
    //        pageControl.currentPageTintColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
    //    }
    
    func setupTextView() {
        
    }
    
    func setupCollection() {
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
        //        collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
    }
}
