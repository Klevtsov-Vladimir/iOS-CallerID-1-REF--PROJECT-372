import Foundation
import CallKit
import OSLog

class CallDirectoryHandler: CXCallDirectoryProvider {
    override func beginRequest(with context: CXCallDirectoryExtensionContext) {
        context.delegate = self
        
        do {
            try addBlockingPhoneNumbers(to: context)
        } catch {
            NSLog("Unable to add blocking phone numbers")
            let error = NSError(domain: "CallDirectoryHandler", code: 1, userInfo: nil)
            context.cancelRequest(withError: error)
            return
        }
        
        do {
            try addIdentificationPhoneNumbers(to: context)
        } catch {
            NSLog("Unable to add identification phone numbers")
            let error = NSError(domain: "CallDirectoryHandler", code: 2, userInfo: nil)
            context.cancelRequest(withError: error)
            return
        }
        
        context.completeRequest()
    }
    
    private func addBlockingPhoneNumbers(to context: CXCallDirectoryExtensionContext) throws {
        let userDefaults = UserDefaults(suiteName: appGroup)
        guard let numbers = (userDefaults?.value(forKey: "blockNumbers")) as? [String:Any], !numbers.isEmpty else {
            let firstNum: [CXCallDirectoryPhoneNumber] = [+61285038000]
            context.addBlockingEntry(withNextSequentialPhoneNumber: firstNum.first ?? CXCallDirectoryPhoneNumber())
            return
        }
        var array = [CXCallDirectoryPhoneNumber]()
        
        
        let sordedNums = numbers.sorted { first, second in
            let a = Int(first.key) ?? 0
            let b = Int(second.key) ?? 0
            return a < b
        }
        
        print(sordedNums)
        
        for num in sordedNums {
            if !num.key.contains("+") {
                array.append(PhoneNumberFormatter.phoneNumber(phoneNumberString: "+" + num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "")) ?? CXCallDirectoryPhoneNumber())
            } else {
                array.append(PhoneNumberFormatter.phoneNumber(phoneNumberString: num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "")) ?? CXCallDirectoryPhoneNumber())
            }
            print(num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: ""))
        }
    
        let uniqueArray = Array(Set(array)).sorted()
        for phoneNumber in uniqueArray {
            context.addBlockingEntry(withNextSequentialPhoneNumber: phoneNumber)
        }
    }
    
    private func addIdentificationPhoneNumbers(to context: CXCallDirectoryExtensionContext) throws {
        let userDefaults = UserDefaults(suiteName: appGroup)
        guard let numbers = (userDefaults?.value(forKey: "blockNumbers")) as? [String:Any], !numbers.isEmpty else {
            let firstNum: [CXCallDirectoryPhoneNumber] = [+61285038000]
            context.addIdentificationEntry(withNextSequentialPhoneNumber: firstNum.first ?? CXCallDirectoryPhoneNumber(), label: "firstNum")
            return
        }
        
        var array = [CXCallDirectoryPhoneNumber]()
        var arrayI = [String]()
        
        let sordedNums = numbers.sorted { first, second in
            let a = Int(first.key) ?? 0
            let b = Int(second.key) ?? 0
            
            return a < b
        }
        
        print(sordedNums)
        
        for num in sordedNums {
            if !num.key.contains("+") {
                array.append(PhoneNumberFormatter.phoneNumber(phoneNumberString: "+" + num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "")) ?? CXCallDirectoryPhoneNumber())
            } else {
                array.append(PhoneNumberFormatter.phoneNumber(phoneNumberString: num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "")) ?? CXCallDirectoryPhoneNumber())
            }
            
            let name = (num.value as? [String : String])?.values.first ?? ""
            
            print(num.key.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: " ", with: "") + " ---- \(name)")
            
            arrayI.append(name)
        }
        
        print(array)
        
        let uniqueArray = Array(Set(array)).sorted()
        
        for (index, num) in uniqueArray.enumerated() {
            let phone = num
            let name = arrayI[index]
            context.addIdentificationEntry(withNextSequentialPhoneNumber: phone, label: name)
        }
    }
}

extension CallDirectoryHandler: CXCallDirectoryExtensionContextDelegate {
    func requestFailed(for extensionContext: CXCallDirectoryExtensionContext, withError error: Error) {
        // An error occurred while adding blocking or identification entries, check the NSError for details.
        // For Call Directory error codes, see the CXErrorCodeCallDirectoryManagerError enum in <CallKit/CXError.h>.
        //
        // This may be used to store the error details in a location accessible by the extension's containing app, so that the
        // app may be notified about errors which occurred while loading data even if the request to load data was initiated by
        // the user in Settings instead of via the app itself.
    }
}
