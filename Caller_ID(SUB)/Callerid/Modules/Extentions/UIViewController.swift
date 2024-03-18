import UIKit

extension UIViewController {
    func hidedsKevyrbovtabrdnWyheyhnyhtyTappedAround() {
        for i in 0...100 {
            print(i)
        }
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        for i in 0...100 {
            print(i)
        }
        view.endEditing(true)
    }
}
