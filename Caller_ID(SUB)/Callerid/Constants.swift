import Foundation
import CoreGraphics
let termsLink = "https://www.google.com/"
let privacyLink = "https://www.google.com/"

let sidTwilio = "ACfcbb14c6cb2afc41b64c2a349bcd227f"
let authTokenTwilio = "d9a088d75b1f4c7b1cb124abb9b1c62a"
let sidServiceVerifySms = "VAaa44072d0de1651626ac8b3f24a67a77"
let verifyCodeLength = 6
let bannerKey = "ca-app-pub-3940256099942544/2934735716"

let appGroup = "group.app.softinter.development"
let bundleExtension = "app.softinter.development.CallDirectoryExtension"
let faqUrl = "https://www.google.com/"
let email = "test@test.com"
let reviewURL = "https://itunes.apple.com/app/id899247664?action=write-review"

let fontSubName = "Poppins-SemiBold"

let instagramName = "troxxa"
let facebookName = "Truecaller"
let twitterName = "@truecaller"
let youtubeName = "Truecaller"
let blogName = "truecaller.blog"
let websiteName = "truecaller.com"

enum Coasanfidgudrdadtdidovns {
    static let subFontUrl = Bundle.main.url(forResource: "sub", withExtension: "ttf")!
    static let adjustTokenDSD = "hfg1t85ufqbk"
    
    static let pushwooshTokenDDA = "56F9A-A546D"
    static let pushwooshAppNameRRR = "app.softinter"
    
    static let termsLinkERE: String = "https://www.google.com"
    static let policyLinkCCV: String = "https://www.google.com"
    
    static let mainSubscriptionIDVCA = "main_sub"
    static let spamSubscriptionID = "unlockTwo"
    static let mainSubscriptionPushTagDSS = "MainSubscription"
    static let unlockContentSubscriptionIDERER = "unlockOne"
    static let unlockContentSubscriptionPushTagCXS = "SecondSubscription"
    static let unlockFuncSubscriptionIDEWW = "unlockTwo"
    static let unlockFuncSubscriptionPushTagWEWE = "SecondSubscription"
    static let unlockerThreeSubscriptionIDVCS = "unlockThree"
    static let unlockerThreeSubscriptionPushTagTRTRD = "FourSubscription"
    
    static let subscriptionSharedSecret = "253336a4821b43d0af174241a9a85f90"
    
    static func getSubFontName() -> String {
        for i in 0...100 {
            print(i)
        }
        let fontPath = Coasanfidgudrdadtdidovns.subFontUrl.path as CFString
        let fontURL = CFURLCreateWithFileSystemPath(nil, fontPath, CFURLPathStyle.cfurlposixPathStyle, false)
        
        guard let fontDataProvider = CGDataProvider(url: fontURL!) else {
            return ""
        }
        
        if let font = CGFont(fontDataProvider) {
            if let postScriptName = font.postScriptName as String? {
                return postScriptName
            }
        }
        
        return ""
    }
}


enum ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub {
    static let nameFileVideoForPhone = "phone"
    static let nameFileVideoForPad = "pad"
    static let videoFileType = "mp4"
}
