import UIKit

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        for i in 0...100 {
            print(i)
        }
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 1 && UserDefaults.standard.bool(forKey: "isHaveUnlockContentSubscriptionID") == false {
            self.selectedIndex = 0
            let vc = PresmisumMcaidndCofntfrsoller(prod: .spamProduct)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

final class TabBarController: UITabBarController {
    private var searchController: SearchController?
    private var protectController: ProtectController?
    private var moreController: MoreController?
    private var premiumSpamController: PremiumSpamController?
    
    var selectedIndexT = 0
    
    init(selectedIndexT: Int) {
        for i in 0...100 {
            print(i)
        }
        super.init(nibName: nil, bundle: nil)
        self.selectedIndexT = selectedIndexT
    }
    
    required init?(coder: NSCoder) {
        for i in 0...100 {
            print(i)
        }
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        dsfjghcxvbnvshugsfhjsdf()
        
        self.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkSpamPur), name: NSNotification.Name("checkSpamPur"), object: nil)
    }
    
    @objc func checkSpamPur() {
        for i in 0...100 {
            print(i)
        }
        if UserDefaults.standard.bool(forKey: "isHaveUnlockContentSubscriptionID") {
            fsdgsfdgfdsgdfsgfsdgfdggre()
            
            self.selectedIndex = 1
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for i in 0...100 {
            print(i)
        }
        
        if #available(iOS 13, *) {
            let tabBarAppearnace = UITabBarAppearance()
            let tabFont =  UIFont.systemFont(ofSize: 12, weight: .regular)
            
            let selectedAttributes: [NSAttributedString.Key: Any]
            = [NSAttributedString.Key.font: tabFont, NSAttributedString.Key.foregroundColor: UIColor.white]
            let normalAttributes: [NSAttributedString.Key: Any]
            = [NSAttributedString.Key.font: tabFont, NSAttributedString.Key.foregroundColor: UIColor.init(red: 231/255, green: 231/255, blue: 1, alpha: 0.8)]
            
            tabBarAppearnace.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            tabBarAppearnace.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                tabBarAppearnace.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
                tabBarAppearnace.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                
                tabBarAppearnace.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
                tabBarAppearnace.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
                
                tabBarAppearnace.inlineLayoutAppearance.selected.iconColor = .white
                tabBarAppearnace.inlineLayoutAppearance.normal.iconColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 0.8)
                
                tabBarAppearnace.compactInlineLayoutAppearance.selected.iconColor = .white
                tabBarAppearnace.compactInlineLayoutAppearance.normal.iconColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 0.8)
                
               
//                tabBarAppearnace.stackedItemPositioning = .fill
                tabBarAppearnace.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)
                tabBarAppearnace.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)

                tabBarAppearnace.compactInlineLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)
                tabBarAppearnace.compactInlineLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)

                tabBarAppearnace.inlineLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)
                tabBarAppearnace.inlineLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: -10, vertical: 10)
                
            } else {
                tabBarAppearnace.stackedLayoutAppearance.normal.iconColor = .init(red: 231/255, green: 231/255, blue: 1, alpha: 0.8)
                tabBarAppearnace.stackedLayoutAppearance.selected.iconColor = .white
            }
            
            tabBar.standardAppearance = tabBarAppearnace
        } else {
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .selected)
        }
    }
}

//MARK: - Setup
private extension TabBarController {
    func dsfjghcxvbnvshugsfhjsdf() {
        for i in 0...100 {
            print(i)
        }
        fsdgsfdgfdsgdfsgfsdgfdggre()
        
        UITabBar.appearance().tintColor = UIColor.white
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.green
        tabBar.backgroundColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
    }

    func fsdgsfdgfdsgdfsgfsdgfdggre() {
        for i in 0...100 {
            print(i)
        }
        searchController = SearchController()
        
        let searchSelected = #imageLiteral(resourceName: "searchIcon")
        let searchUnselected = #imageLiteral(resourceName: "searchIcon")
        let searchItem = UITabBarItem(
            title: "search".localized(),
            image: searchUnselected,
            selectedImage: searchSelected
        )
        if UIDevice.current.userInterfaceIdiom == .pad {
//            searchItem.
        }
        
        protectController = ProtectController()
        
        if UserDefaults.standard.bool(forKey: "isHaveUnlockContentSubscriptionID") {
            let protectSelected = #imageLiteral(resourceName: "Group 79")
            let protectUnselected = #imageLiteral(resourceName: "Group 79")
            let protectItem = UITabBarItem(
                title: "protect".localized(),
                image: protectUnselected,
                selectedImage: protectSelected
            )
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                protectItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -97)
            } else {
                protectItem.imageInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
            }
            protectController?.tabBarItem = protectItem
        } else {
            let protectSelected = #imageLiteral(resourceName: "Group 79")
            let protectUnselected = #imageLiteral(resourceName: "Group 79")
            let protectItem = UITabBarItem(
                title: "protect".localized(),
                image: protectUnselected,
                selectedImage: protectSelected
            )
            if UIDevice.current.userInterfaceIdiom == .pad {
                protectItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -97)
            } else {
                protectItem.imageInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
            }
            
            protectController?.tabBarItem = protectItem
        }
        
        moreController = MoreController()

        let moreSelected = #imageLiteral(resourceName: "moreIcon")
        let moreUnselected = #imageLiteral(resourceName: "moreIcon")
        let moreItem = UITabBarItem(
            title: "more".localized(),
            image: moreUnselected,
            selectedImage: moreSelected
        )
        
        premiumSpamController = PremiumSpamController()

        let premiumSelected = #imageLiteral(resourceName: "protectIcon")
        let premiumUnselected = #imageLiteral(resourceName: "protectIcon")
        let premiumItem = UITabBarItem(
            title: "protect".localized(),
            image: premiumUnselected,
            selectedImage: premiumSelected
        )
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            searchItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -73)
            moreItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -65)
            premiumItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -76)
        } else {
        }
        
        searchController?.tabBarItem = searchItem
        moreController?.tabBarItem = moreItem
        premiumSpamController?.tabBarItem = premiumItem
        
        guard
            let searchController = self.searchController,
            let protectController = self.protectController,
            let moreController = self.moreController,
            let premiumController = self.premiumSpamController
        else { return }

        let searchNavigation = UINavigationController(rootViewController: searchController)
        let protectNavigation = UINavigationController(rootViewController: protectController)
        let moreNavigation = UINavigationController(rootViewController: moreController)
        let premiumNavigation = UINavigationController(rootViewController: premiumController)

        //final
        if UserDefaults.standard.bool(forKey: "isHaveUnlockContentSubscriptionID") {
            self.viewControllers = [searchNavigation, premiumNavigation, moreNavigation]
        } else {
            self.viewControllers = [searchNavigation, protectNavigation, moreNavigation]
        }
        
        self.selectedIndex = selectedIndexT
    }
}
