import UIKit

final class TabBarController: UITabBarController {
    private var searchController: SearchController?
    private var moreController: MoreController?
    private var premiumSpamController: PremiumSpamController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 13, *) {
            let tabBarAppearnace = UITabBarAppearance()
            
            let tabFont =  UIFont(name: "MontserratRoman-SemiBold", size: 10)
            let tabFontSelected =  UIFont(name: "MontserratRoman-ExtraBold", size: 10)
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: tabFontSelected,
                NSAttributedString.Key.foregroundColor: UIColor(named: "PurpleButton")
            ]
            
            let normalAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: tabFont,
                NSAttributedString.Key.foregroundColor: UIColor(named: "textGray")
            ]
            
            tabBarAppearnace.stackedLayoutAppearance.normal.iconColor = UIColor(named: "textGray")
            tabBarAppearnace.stackedLayoutAppearance.selected.iconColor = UIColor(named: "PurpleButton")
            
            tabBarAppearnace.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -13)
            
            tabBarAppearnace.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            tabBarAppearnace.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            
            tabBar.standardAppearance = tabBarAppearnace
        } else {
            tabBar.standardAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "textGray")
            tabBar.standardAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "PurpleButton")
        }
        
    }
    
    //MARK: - Setup
    private func setup() {
        setupItems()
        
        UITabBar.appearance().tintColor = UIColor.white
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.green
        tabBar.backgroundColor = .clear
        
    }
    
    func setupItems() {
        searchController = SearchController()
        
        let searchSelected = #imageLiteral(resourceName: "Search")
        let searchUnselected = #imageLiteral(resourceName: "Search")
        let searchItem = UITabBarItem(
            title: "search".localized(),
            image: searchUnselected,
            selectedImage: searchSelected
        )
        if UIDevice.current.userInterfaceIdiom == .pad {
            //            searchItem.
        }
        
        
        moreController = MoreController()
        
        let moreSelected = #imageLiteral(resourceName: "Name=More")
        let moreUnselected = #imageLiteral(resourceName: "Name=More")
        let moreItem = UITabBarItem(
            title: "more".localized(),
            image: moreUnselected,
            selectedImage: moreSelected
        )
        
        premiumSpamController = PremiumSpamController()
        
        let premiumSelected = #imageLiteral(resourceName: "Name=Secure")
        let premiumUnselected = #imageLiteral(resourceName: "Name=Secure")
        let premiumItem = UITabBarItem(
            title: "protect".localized(),
            image: premiumUnselected,
            selectedImage: premiumSelected
        )
        searchItem.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: 3, right: 0)
        moreItem.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: 3, right: 0)
        premiumItem.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: 3, right: 0)
        
                if UIDevice.current.userInterfaceIdiom == .pad {
                    searchItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: 0)
                    moreItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -65)
                    premiumItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -56)
                }
        searchController?.tabBarItem = searchItem
        moreController?.tabBarItem = moreItem
        premiumSpamController?.tabBarItem = premiumItem
        
        guard
            let searchController = self.searchController,
            let moreController = self.moreController,
            let premiumController = self.premiumSpamController
        else { return }
        
        let searchNavigation = UINavigationController(rootViewController: searchController)
        let moreNavigation = UINavigationController(rootViewController: moreController)
        let premiumNavigation = UINavigationController(rootViewController: premiumController)
        
        self.viewControllers = [searchNavigation, premiumNavigation, moreNavigation]
        self.selectedIndex = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarHeight: CGFloat = 63
        let distanceFromBottom: CGFloat = 57
        
        var tabBarFrame = self.tabBar.frame
        tabBarFrame.origin.y = self.view.frame.height - distanceFromBottom - tabBarHeight
        tabBarFrame.size.height = tabBarHeight
        
        self.tabBar.frame = tabBarFrame
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let items = tabBar.items, items.count > 0 else { return }
        
        let itemWidth: CGFloat = 62
        let itemHeight: CGFloat = 63
        
        tabBar.subviews.forEach { view in
            if view.backgroundColor == .clear || view.backgroundColor == .white {
                view.removeFromSuperview()
            }
        }
        for (index, item) in items.enumerated() {
            let itemCenterX = (CGFloat(index) + 0.5) * (tabBar.frame.width / CGFloat(items.count))
            let squareView = UIView(frame: CGRect(x: itemCenterX - (itemWidth / 2), y: 0, width: itemWidth, height: itemHeight))
            if index != selectedIndex {
                squareView.backgroundColor = .clear
                squareView.layer.borderWidth = 1
                squareView.layer.borderColor = UIColor.gray.cgColor
            } else {
                squareView.backgroundColor = .white
                squareView.layer.borderWidth = 0
                squareView.addShadow(
                    shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                    shadowOffset: CGSize(width: 0, height: 0),
                    shadowRadius: 6.1,
                    shadowOpacity: 0.7
                )
            }
            squareView.layer.cornerRadius = 20
            tabBar.insertSubview(squareView, at: 0)
        }
    }
    
}

