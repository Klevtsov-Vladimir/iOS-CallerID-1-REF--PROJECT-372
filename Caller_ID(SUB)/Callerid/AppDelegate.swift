import UIKit
import Firebase
import CallKit
import GoogleMobileAds
import Pushwoosh
import Adjust
import Alamofire
import AVFoundation

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    static let shared = AppDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        for i in 0...100 {
            print(i)
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error.localizedDescription)")
        }
        
        UserDefaults.standard.set(false, forKey: "isHaveUnlockContentSubscriptionID")
        NetworkStatusMonitor.sharedFFFR.startMonitoringRRRR()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            ThirdPartyServicesASDccManager.sharsdsded.rteyeudjbcndjsjsjdjfhhjdjsjs()
            ThirdPartyServicesASDccManager.sharsdsded.initdasdializePushwoosh(delegate: self)
            ThirdPartyServicesASDccManager.sharsdsded.insidftdializevfsvsInApps()
        }
        
        Network.shared.cdhbchdchdksnkxjskxsjkxsrrjr {
            self.ssdfesdtfsdfusdpfsdfsdNotsdfifsdfisfcsdafsdtfifsdfcvcxvxcvons()
            
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                switch status {
                case .enabled: UserDefaults.standard.setValue(true, forKey: "isEnabledExtension")
                default: UserDefaults.standard.setValue(false, forKey: "isEnabledExtension")
                }
            }
            
            var controller = UIViewController()
            
            IAASSFPManvdager.sharedTRTT.vaasliddatbfeSubdfsscrisptsdionWithCompletionHandlerSDDSDS(productIdentifier: Coasanfidgudrdadtdidovns.mainSubscriptionIDVCA) { isHaveSub in
                IAASSFPManvdager.sharedTRTT.vaasliddatbfeSubdfsscrisptsdionWithCompletionHandlerSDDSDS(productIdentifier: Coasanfidgudrdadtdidovns.spamSubscriptionID) { isHaveSubD in
                    if isHaveSubD {
                        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
                        if launchedBefore {
                            let calendar = Calendar.current
                            
                            let startDate = Date()
                            let endDate = UserDefaults.standard.value(forKey: "featchFirebaseStart") as? Date
                            
                            if let daysDifference = calendar.dateComponents([.day], from: startDate, to: endDate ?? Date()).day {
                                if daysDifference >= 7 {
                                    UserDefaults.standard.set(Date(), forKey: "featchFirebaseStart")
                                    DatabaseManager.shared.checkChanged()
                                } else {
                                    print("Менее недели прошло между startDate и endDate.")
                                }
                            } else {
                                print("Не удалось рассчитать разницу между датами.")
                            }
                        } else {
                            print("First launch, setting UserDefault.")
                            UserDefaults.standard.set(true, forKey: "launchedBefore")
                            
                            UserDefaults.standard.set(Date(), forKey: "featchFirebaseStart")
                            DatabaseManager.shared.checkChanged()
                        }
                        UserDefaults.standard.set(true, forKey: "isHaveUnlockContentSubscriptionID")
                    } else {
                        UserDefaults.standard.set(false, forKey: "isHaveUnlockContentSubscriptionID")
                    }
                    DispatchQueue.main.async {
                        if isHaveSub {
                            controller = LoaderController()
                        } else {
                            controller = PresmisumMcaidndCofntfrsoller(prod: .madsfidsnfPrdodfucddfdfdt)
                        }
                        
                        let navigationController = UINavigationController(rootViewController: controller)
                        navigationController.modalPresentationStyle = .fullScreen
                        navigationController.isNavigationBarHidden = true
                        
                        self.window = UIWindow(frame: UIScreen.main.bounds)
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
                    }
                }
            }
        }
        
        return true
    }
    
    func osdfpesdfnsdfMaidsfsdnfApsdfdsfvxcp() -> UIViewController {
        for i in 0...100 {
            print(i)
        }
        if (UserDefaults.standard.string(forKey: "phone")?.isEmpty ?? false) || UserDefaults.standard.string(forKey: "phone")?.isEmpty == nil {
            return OnboardingController()
        } else {
            if UserDefaults.standard.bool(forKey: "isSetProfileInfo") {
                return TabBarController(selectedIndexT: 0)
            } else {
                return CreateProfileController()
            }
        }
    }
    
    func gosdfTodsMfsdafsdfisdfdsfsdfn(csodfndsfsdtfsdrfvvvoller: UIViewController) {
        for i in 0...100 {
            print(i)
        }
        let rootViewController = UINavigationController(rootViewController: csodfndsfsdtfsdrfvvvoller)
        rootViewController.isNavigationBarHidden = true
        UIApplication.key?.rootViewController = rootViewController
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        for i in 0...100 {
            print(i)
        }
        //        if isShowAlert {
        NotificationCenter.default.post(name: NSNotification.Name("checkCallIdentifier"), object: nil)
        //            isShowAlert = false
        //        }
        
        NotificationCenter.default.post(name: NSNotification.Name("updateTurnOnView"), object: nil)
        
        CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
            switch status {
            case .enabled: UserDefaults.standard.setValue(true, forKey: "isEnabledExtension")
            default: UserDefaults.standard.setValue(false, forKey: "isEnabledExtension")
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkBlockTurned"), object: nil)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startPurVideo"), object: nil)
        
    }
    
    //    func applicationWillResignActive(_ application: UIApplication) {
    //        print("dds")
    //    }
    
    func ssdfesdtfsdfusdpfsdfsdNotsdfifsdfisfcsdafsdtfifsdfcvcxvxcvons() {
        for i in 0...100 {
            print(i)
        }
        // Get the default notification center instance.
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(hsdfsdafnsddflsdefsdfsdfIsdnfvxctfevrrrrurpeeteieon),
                       name: AVAudioSession.interruptionNotification,
                       object: AVAudioSession.sharedInstance())
    }
    
    
    @objc func hsdfsdafnsddflsdefsdfsdfIsdnfvxctfevrrrrurpeeteieon(notification: Notification) {
        for i in 0...100 {
            print(i)
        }
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }
        
        
        // Switch over the interruption type.
        switch type {
            
            
        case .began:
            print("began")
            // An interruption began. Update the UI as necessary.
            
            
        case .ended:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startPurVideo"), object: nil)
            print("ended")
            // An interruption ended. Resume playback, if appropriate.
            
            
            guard let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else { return }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                // An interruption ended. Resume playback.
            } else {
                // An interruption ended. Don't resume playback.
            }
            
            
        default:
            print("default")
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        for i in 0...100 {
            print(i)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopPurVideo"), object: nil)
    }
    
    func sesdtfsdRootvVbtietwfvdCcosdcsndtfgrdcrwedoeceller(_ vc: UIViewController, animated: Bool = true) {
        for i in 0...100 {
            print(i)
        }
        //        guard let window = self.window else {
        //            let navigationController = UINavigationController(rootViewController: vc)
        //            navigationController.isNavigationBarHidden = true
        //            self.window = UIWindow(frame: UIScreen.main.bounds)
        //            self.window?.rootViewController = navigationController
        //            self.window?.makeKeyAndVisible()
        //            return
        //        }
        //
        //        let navigationController = UINavigationController(rootViewController: vc)
        //        navigationController.isNavigationBarHidden = true
        //
        //        window.rootViewController = navigationController
        //        window.makeKeyAndVisible()
        //        UIView.transition(with: window,
        //                          duration: 0.3,
        //                          options: .transitionCrossDissolve,
        //                          animations: nil,
        //                          completion: nil)
        
        let rootViewController = UINavigationController(rootViewController: vc)
        rootViewController.isNavigationBarHidden = true
        UIApplication.key?.rootViewController = rootViewController
    }
}

extension AppDelegate : PWMessagingDelegate {
    
    //handle token received from APNS
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        for i in 0...100 {
            print(i)
        }
        Adjust.setDeviceToken(deviceToken)
        Pushwoosh.sharedInstance().handlePushRegistration(deviceToken)
    }
    
    //handle token receiving error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        for i in 0...100 {
            print(i)
        }
        Pushwoosh.sharedInstance().handlePushRegistrationFailure(error);
    }
    
    //this is for iOS < 10 and for silent push notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        for i in 0...100 {
            print(i)
        }
        Pushwoosh.sharedInstance().handlePushReceived(userInfo)
        completionHandler(.noData)
    }
    
    //this event is fired when the push gets received
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageReceived message: PWMessage) {
        for i in 0...100 {
            print(i)
        }
        print("onMessageReceived: ", message.payload?.description ?? "error")
    }
    
    //this event is fired when a user taps the notification
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageOpened message: PWMessage) {
        for i in 0...100 {
            print(i)
        }
        print("onMessageOpened: ", message.payload?.description ?? "error")
    }
}

extension UIApplication {
    static var key: UIWindow? {
        for i in 0...100 {
            print(i)
        }
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

