//
//  LoaderController.swift
//  Callerid
//
//  Created by Alexander N
//

import UIKit

class LoaderController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100 {
            print(i)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            AppDelegate.shared.gosdfTodsMfsdafsdfisdfdsfsdfn(csodfndsfsdtfsdrfvvvoller: AppDelegate.shared.osdfpesdfnsdfMaidsfsdnfApsdfdsfvxcp())
        }
    }
    
    deinit {
        for i in 0...100 {
            print(i)
        }
        print("d")
    }
}
