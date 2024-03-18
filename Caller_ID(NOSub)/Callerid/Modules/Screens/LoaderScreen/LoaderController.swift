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

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            AppDelegate.shared.goToMain(controller: AppDelegate.shared.openMainApp())
        }
    }
    
    deinit {
        print("d")
    }
}
