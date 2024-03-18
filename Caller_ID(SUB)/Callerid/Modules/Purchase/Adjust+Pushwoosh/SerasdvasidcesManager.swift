import Foundation
import UIKit
import Adjust
import Pushwoosh
import AppTrackingTransparency
import AdSupport

class ThirdPartyServicesASDccManager {
    
    static let sharsdsded = ThirdPartyServicesASDccManager()
    
    func rteyeudjbcndjsjsjdjfhhjdjsjs() {
        let yourAppToken = Coasanfidgudrdadtdidovns.adjustTokenDSD
#if DEBUG
        let environment = (ADJEnvironmentSandbox as? String)!
#else
        let environment = (ADJEnvironmentProduction as? String)!
#endif
        let adjustConfig = ADJConfig(appToken: yourAppToken, environment: environment)
        
        adjustConfig?.logLevel = ADJLogLevelVerbose
        
        Adjust.appDidLaunch(adjustConfig)
    }
    
    func initdasdializePushwoosh(delegate: PWMessagingDelegate) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        //set custom delegate for push handling, in our case AppDelegate
        Pushwoosh.sharedInstance().delegate = delegate;
        PushNotificationManager.initialize(withAppCode: Coasanfidgudrdadtdidovns.pushwooshTokenDDA, appName: Coasanfidgudrdadtdidovns.pushwooshAppNameRRR)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
        Pushwoosh.sharedInstance().registerForPushNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    
    func insidftdializevfsvsInApps(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        IAASSFPManvdager.sharedTRTT.loadProductsFuncSDFSDF()
        IAASSFPManvdager.sharedTRTT.completeAllTransactionsFuncSDSD()
    }
    
    
    func amsmdnhhcggcgdhwhjwjwtrtyuiuytghjhgfhj() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
//                    print("Authorized")
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier
//                    print("Пользователь разрешил доступ. IDFA: ", idfa)
                    let authorizationStatus = Adjust.appTrackingAuthorizationStatus()
                    Adjust.updateConversionValue(Int(authorizationStatus))
                    Adjust.checkForNewAttStatus()
                    print(ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    print("Denied")
                case .notDetermined:
                    print("Not Determined")
                case .restricted:
                    print("Restricted")
                @unknown default:
                    print("Unknown")
                }
            }
        }
    }
}

