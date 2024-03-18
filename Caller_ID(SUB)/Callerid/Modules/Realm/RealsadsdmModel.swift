import Foundation
import UIKit
import RealmSwift

final class ProfileDB: Object {
    @objc dynamic var avatarImage: Data = Data()
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var job: String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var zip: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var company: String = ""
    
    dynamic var historyPhoneSearch = List<HistoryPhoneSearch>()
    
    @objc dynamic var id: Int = 0
    override class func primaryKey() -> String? {
        return "id"
    }
}

final class HistoryPhoneSearch: Object {
    @objc dynamic var phoneNumber: String = ""
    @objc dynamic var phoneNumberWithDial: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var dateChanged: Date = Date()
    @objc dynamic var country: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var isBlocked: Bool = false
}
