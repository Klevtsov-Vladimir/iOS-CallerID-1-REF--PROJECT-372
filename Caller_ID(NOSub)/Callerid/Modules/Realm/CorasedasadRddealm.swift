import UIKit
import RealmSwift

final class CorasedasadRddealm: NSObject {
    public static let shared = CorasedasadRddealm()
    private let realmService = ReaSDFSlmSerDFvice()
    public lazy var profileDB : Results<ProfileDB> = { realmService.loadRealm(ofType: ProfileDB.self) }()
    
    private var realm : Realm {
        get {
            return realmService.realm
        }
    }
    
    private override init() {
        super.init()
    }
    
    private func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(ProfileDB.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    func addUser(model: ProfileDB) {
        model.id = incrementID()
        realmService.insertObject(model)
    }
    
    func reasdmasodvaeAasdlalsdsad() {
        realmService.deleteAll()
    }
    
    func updateValue(list: [String : Any?]) {
        guard let user = profileDB.first else { return }
        realmService.update(user, with: list)
    }
}
