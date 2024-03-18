import UIKit
import FirebaseDatabase
import FirebaseStorage

final class DatabaseManager {
    static let shared = DatabaseManager()
    private let reference = Database.database().reference()

    func setPhone(_ phone: String) {
        reference.observe(.value) { [weak self] value in
            if value.hasChild("users") {
                if !value.hasChild(phone) {
                    self?.reference.child("users").child(phone).child("firstName").setValue("")
                }
            } else {
                self?.reference.child("users").child(phone).child("firstName").setValue("")
            }
        }
    }
    
    func checkChanged() {
        reference.child("phones").observe(.value) { snapshot, _ in
            guard let value = snapshot.value as? [String:Any] else {
                return
            }
            
            let userDefaults = UserDefaults(suiteName: appGroup)
            userDefaults?.setValue(value, forKey: "blockNumbers")
        
            CallDirectoryManagerUtils.reloadExtension {}
        }
    }
    
    func setNewPhoneIdent(phone: [String:String]) {
        reference.child("phones").child(phone.keys.first ?? "").setValue(phone)
    }

    func setProfileInfo(avatarImage: UIImage? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil) {
        let phone = UserDefaults.standard.string(forKey: "phone") ?? ""
        if let avatarImage = avatarImage {
            uploadMedia(image: avatarImage) { [weak self] url in
                self?.reference.child("users").child(phone).child("avatarImage").setValue(url)
            }
        }

        if let firstName = firstName {
            reference.child("users").child(phone).child("firstName").setValue(firstName)
        }

        if let lastName = lastName {
            reference.child("users").child(phone).child("lastName").setValue(lastName)
        }

        if let email = email {
            reference.child("users").child(phone).child("email").setValue(email)
        }
    }
}

//MARK: - Private methods
private extension DatabaseManager {
    func uploadMedia(image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        let phone = UserDefaults.standard.string(forKey: "phone") ?? ""
        let storageRef = Storage.storage().reference().child(phone).child("avatarImage")
        if let uploadData = image.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {
                    storageRef.downloadURL { url, error in
                        if error != nil {
                            print("error")
                            completion(nil)
                        } else {
                            completion(url?.absoluteString ?? "")
                        }
                    }
                }
            }
        }
    }
}
