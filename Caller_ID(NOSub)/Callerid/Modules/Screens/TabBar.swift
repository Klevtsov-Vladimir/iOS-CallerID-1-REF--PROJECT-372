import UIKit

final class TabBarController: UITabBarController {
    private var searchController: SearchController?

    private var moreController: MoreController?
    private var premiumSpamController: PremiumSpamController?

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        setup()

    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    func setup() {
        setupItems()
        
        UITabBar.appearance().tintColor = UIColor.white
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.green
        tabBar.backgroundColor = .init(red: 105/255, green: 137/255, blue: 254/255, alpha: 1)
    }

    func setupItems() {
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
        
        
        moreController = MoreController()

        let moreSelected = #imageLiteral(resourceName: "moreIcon")
        let moreUnselected = #imageLiteral(resourceName: "moreIcon")
        let moreItem = UITabBarItem(
            title: "more".localized(),
            image: moreUnselected,
            selectedImage: moreSelected
        )
        
        premiumSpamController = PremiumSpamController()

        let premiumSelected = #imageLiteral(resourceName: "moreIcon")
        let premiumUnselected = #imageLiteral(resourceName: "moreIcon")
        let premiumItem = UITabBarItem(
            title: "protect".localized(),
            image: premiumUnselected,
            selectedImage: premiumSelected
        )
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            searchItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -73)
            moreItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -65)
            premiumItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: -76)
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
}
