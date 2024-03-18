import UIKit
import Firebase
import CallKit
import GoogleMobileAds
import Alamofire
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    static let shared = AppDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        var controller = UIViewController()
        
        controller = LoaderController()

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        networkConnection()
        
        return true
    }
    
    func networkConnection() {
        Network.shared.loadJson {
            self.setupNotifications()
            
            let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
            if launchedBefore  {
                let calendar = Calendar.current

                // Укажите дату, с которой вы хотите сравнивать
                let startDate = Date() // Текущая дата и время
                let endDate = UserDefaults.standard.value(forKey: "featchFirebaseStart") as? Date// Здесь укажите дату, с которой вы хотите сравнивать

                // Рассчитайте разницу между датами в днях
                if let daysDifference = calendar.dateComponents([.day], from: startDate, to: endDate ?? Date()).day {
                    if daysDifference >= 7 {
                        print("Прошла неделя или более между startDate и endDate.")
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
            
            
            CallDirectoryManagerUtils.getEnabledStatusForExtension { status in
                switch status {
                case .enabled: UserDefaults.standard.setValue(true, forKey: "isEnabledExtension")
                default: UserDefaults.standard.setValue(false, forKey: "isEnabledExtension")
                }
            }
            
            
        }
    }
    func openMainApp() -> UIViewController {
        if (UserDefaults.standard.string(forKey: "phone")?.isEmpty ?? false) || UserDefaults.standard.string(forKey: "phone")?.isEmpty == nil {
            return OnboardingController()
        } else {
            if UserDefaults.standard.bool(forKey: "isSetProfileInfo") {
                return TabBarController()
            } else {
                return CreateProfileController()
            }
        }
    }
    
    func goToMain(controller: UIViewController) {
        let rootViewController = UINavigationController(rootViewController: controller)
        rootViewController.isNavigationBarHidden = true
        UIApplication.key?.rootViewController = rootViewController
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //        if isShowAlert {
        NotificationCenter.default.post(name: NSNotification.Name("updateTurnOnView"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("checkCallIdentifier"), object: nil)
        //            isShowAlert = false
        //        }
        
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
    
    func setupNotifications() {
        // Get the default notification center instance.
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(handleInterruption),
                       name: AVAudioSession.interruptionNotification,
                       object: AVAudioSession.sharedInstance())
    }
    
    
    @objc func handleInterruption(notification: Notification) {
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopPurVideo"), object: nil)
    }
    
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        
        let rootViewController = UINavigationController(rootViewController: vc)
        rootViewController.isNavigationBarHidden = true
        UIApplication.key?.rootViewController = rootViewController
    }
}



extension UIApplication {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

