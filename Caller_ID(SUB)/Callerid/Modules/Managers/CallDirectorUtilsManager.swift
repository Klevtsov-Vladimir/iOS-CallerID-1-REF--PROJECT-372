import CallKit

class CallDirectoryManagerUtils {
    class func getEnabledStatusForExtension(callback: @escaping (CXCallDirectoryManager.EnabledStatus)->()) {
        let callDirectoryManager = CXCallDirectoryManager.sharedInstance
        
        callDirectoryManager.getEnabledStatusForExtension(withIdentifier: bundleExtension) { (status, error) in
            guard error == nil else {
                callback(.unknown)
                return
            }
            
            if status == .unknown {
                callDirectoryManager.reloadExtension(withIdentifier: bundleExtension) { (error) in
                    if let _ = error {
                        callback(.unknown)
                        return
                    }
                    callback(.enabled)
                }
            } else if status == .disabled {
                callback(.disabled)
            } else if status == .enabled {
                callback(.enabled)
            }
        }
    }
    
    class func reloadExtension(closure: @escaping ()->()) {
        CXCallDirectoryManager.sharedInstance.reloadExtension (
            withIdentifier: bundleExtension,
            completionHandler: {(error) -> Void in
                print("reloadExtension")
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    closure()
                }
            })
    }
}
