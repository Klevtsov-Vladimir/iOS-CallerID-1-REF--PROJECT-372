import UIKit

extension UIDevice {
    public enum DeviceModel {
        case iPhone5s, iPhoneSE, iPhone6, iPhone6s, iPhone6Plus, iPhone6sPlus, iPhone7, iPhone7Plus, iPhone8, iPhone8Plus, iPhoneX, iPhoneXR, iPhoneXS, iPhoneXSMax, iPhone11, iPhone11Pro, iPhone11ProMax, iPhoneSE2020, iphone12Mini, iPhone12, iPhone12Pro, iPhone12ProMax, simulator, undefined
        
        var stringValie: String {
            switch self {
            case .iPhone5s:
                return "iPhone 5s"
            case .iPhoneSE:
                return "iPhone SE"
            case .iPhone6:
                return "iPhone 6"
            case .iPhone6Plus:
                return "iPhone 6 Plus"
            case .iPhone6s:
                return "iPhone 6s"
            case .iPhone6sPlus:
                return "iPhone 6s Plus"
            case .iPhone7:
                return "iPhone 7"
            case .iPhone7Plus:
                return "iPhone 7 Plus"
            case .iPhone8:
                return "iPhone 8"
            case .iPhone8Plus:
                return "iPhone 8 Plus"
            case .iPhoneX:
                return "iPhone X"
            case .iPhoneXR:
                return "iPhone XR"
            case .iPhoneXS:
                return "iPhone XS"
            case .iPhoneXSMax:
                return "iPhone XS Max"
            case .iPhone11:
                return "iPhone 11"
            case .iPhone11Pro:
                return "iPhone 11 Pro"
            case .iPhone11ProMax:
                return "iPhone 11 Pro Max"
            case .iPhoneSE2020:
                return "iPhone SE 2020"
            case .iphone12Mini:
                return "iPhone 12 Mini"
            case .iPhone12:
                return "iPhone 12"
            case .iPhone12Pro:
                return "iPhone 12 Pro"
            case .iPhone12ProMax:
                return "iPhone 12 Pro Max"
            default:
                return "undefined"
            }
        }
    }
    
    static let model: DeviceModel = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> DeviceModel {
#if os(iOS)
            switch identifier {
            case "iPhone6,1", "iPhone6,2":                  return .iPhone5s
            case "iPhone7,2":                               return .iPhone6
            case "iPhone7,1":                               return .iPhone6Plus
            case "iPhone8,1":                               return .iPhone6s
            case "iPhone8,2":                               return .iPhone6sPlus
            case "iPhone9,1", "iPhone9,3":                  return .iPhone7
            case "iPhone9,2", "iPhone9,4":                  return .iPhone7Plus
            case "iPhone8,4":                               return .iPhoneSE
            case "iPhone10,1", "iPhone10,4":                return .iPhone8
            case "iPhone10,2", "iPhone10,5":                return .iPhone8Plus
            case "iPhone10,3", "iPhone10,6":                return .iPhoneX
            case "iPhone11,2":                              return .iPhoneXS
            case "iPhone11,4", "iPhone11,6":                return .iPhoneXSMax
            case "iPhone11,8":                              return .iPhoneXR
            case "iPhone12,1":                              return .iPhone11
            case "iPhone12,3":                              return .iPhone11Pro
            case "iPhone12,5":                              return .iPhone11ProMax
            case "iPhone12,8":                              return .iPhoneSE2020
            case "iPhone13,1":                              return .iphone12Mini
            case "iPhone13,2":                              return .iPhone12
            case "iPhone13,3":                              return .iPhone12Pro
            case "iPhone13,4":                              return .iPhone12ProMax
            case "i386", "x86_64":                          return .simulator
            default:                                        return .undefined
            }
#endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
    // Only screen sizes for supported models are listed
    public enum DeviceScreen {
        case size320x568, size375x667, size414x736, size375x812, size414x896, undefined
        
        var height: CGFloat {
            return UIScreen.main.bounds.size.height
        }
        
        var width: CGFloat {
            return UIScreen.main.bounds.size.width
        }
        
        var splashImage: UIImage? {
            switch self {
            case .size320x568:
                return UIImage(named: "Splash_SE")
            case .size375x667:
                return UIImage(named: "Splash_6")
            case .size414x736:
                return UIImage(named: "Splash_6 plus")
            case .size375x812:
                return UIImage(named: "Splash_X")
            case .size414x896:
                return UIImage(named: "Splash_XR_XS_MAX")
            default:
                return nil
            }
        }
        
        var stringRepresentation: String {
            switch self {
            case .size320x568, .undefined:
                return "size320x568"
            case .size375x667:
                return "size375x667"
            case .size414x736:
                return "size414x736"
            case .size375x812:
                return "size375x812"
            case .size414x896:
                return "size414x896"
            }
        }
    }
    
    static let screen: DeviceScreen = {
        let screenSize = UIScreen.main.bounds.size
        
#if os(iOS)
        switch screenSize {
        case CGSize(width: 320, height: 568):               return .size320x568
        case CGSize(width: 375, height: 667):               return .size375x667
        case CGSize(width: 414, height: 736):               return .size414x736
        case CGSize(width: 375, height: 812):               return .size375x812
        case CGSize(width: 414, height: 896):               return .size414x896
        default:                                            return .undefined
        }
#endif
    }()
    
    public enum PhoneType {
        case iPhone5, iPhone6, iPhone6Plus, iPhoneX, iPhoneMax
    }
    
    static let phoneType: PhoneType = {
        switch screen {
            // 5s, se
        case .size320x568:
            return .iPhone5
            // 6, 7, 8
        case .size375x667:
            return .iPhone6
            // 6+, 7+, 8+
        case .size414x736:
            return .iPhone6Plus
            // X, XS, 11pro
        case .size375x812:
            return .iPhoneX
            // Other iPhones
        case .size414x896:
            return .iPhoneMax
        default:
            return .iPhoneMax
        }
    }()
}
