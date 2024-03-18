import Foundation
import UIKit
import RealmSwift

final class ReaSDFSlmSerDFvice {
    
    static let config = Realm.Configuration(
        schemaVersion: 5,
        migrationBlock: { migration, oldSchemaVersion in
            switch oldSchemaVersion {
            case 1:
                break
            default:
                break
            }
        })
    var realm = try! Realm(configuration: ReaSDFSlmSerDFvice.config)
    
    init() { }
    
    public static var shared = ReaSDFSlmSerDFvice()
    
    func loadRealm<T: Object>(ofType: T.Type) -> Results<T> {
        return realm.objects(T.self)
    }
    
    func generateID<T: Object>(ofType: T.Type) -> Int {
        let realm = try! Realm()
        return (realm.objects(T.self).max(ofProperty: "primaryKey") as Int? ?? 0) + 1
    }
    
    func update(_ object: Object, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print("⚠️Failed to update \(object) in realm: \(error.localizedDescription)")
        }
    }
    
    func insertObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .error)
            }
        } catch {
            print("⚠️Failed to update \(object) in realm: \(error.localizedDescription)")
        }
    }
    
    func updateRm<T: Object>(_ object: T, with dictionary: [String: Any]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print("⚠️Failed to update \(object) in realm: \(error.localizedDescription)")
        }
    }
    
    
    func deleteRm<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("⚠️Failed to update \(object) in realm: \(error.localizedDescription)")
        }
    }
    
    func deleteSequenceRm<S>(_ sequence: S) where S: Sequence, S.Element: ObjectBase {
        do {
            try realm.write {
                realm.delete(sequence)
            }
        } catch {
            print("⚠️Failed to update \(sequence) in realm: \(error.localizedDescription)")
        }
    }
    
    func deleteAll() -> Bool {
        do {
            try realm.write {
                realm.deleteAll()
            }
            return true
        } catch {
            print("⚠️Failed to delete all")
            return false
        }
    }
}
