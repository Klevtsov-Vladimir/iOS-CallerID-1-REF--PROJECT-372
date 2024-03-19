//
//  LoaderController.swift
//  Callerid
//
//  Created by Alexander N
//

import UIKit
import Reachability

class LoaderController: UIViewController {
    
    @IBOutlet var noConLabel: UILabel!
    @IBOutlet var okeyButton: UIButton!
    @IBOutlet var ckeckMarkImage: UIImageView!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var ellipsImage: UIImageView!
    
    
    @IBAction func tapOkeyButton(_ sender: Any) {
        AppDelegate.shared.networkConnection()
        noConLabel.isHidden = true
        okeyButton.isHidden = true
        isInternetAvailable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ckeckMarkImage.isHidden = true
        setUpButton()
        rotateView(view: ellipsImage, duration: 2.0)
        setUpPrLabels()
        isInternetAvailable()
        
    }
    
    deinit {
        print("d")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addGradient(colors: [UIColor(named: "bg1stColor") ?? .clear, UIColor(named: "bg2ndColor") ?? .clear],
                         startPoint: CGPoint(x: 0.5, y: 0),
                         endPoint: CGPoint(x: 0.5, y: 1))
    }

    func rotateView(view: UIView, duration: Double) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: -(Double.pi * 2.0))
        rotationAnimation.duration = duration
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.infinity
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    func setUpPrLabels() {
        percentageLabel.font = UIFont(name: "Manrope-SemiBold", size: 30)
        noConLabel.text = "noConnection".localized()
        noConLabel.font = UIFont(name: "Manrope-SemiBold", size: 20)
        noConLabel.textColor = .white
        noConLabel.isHidden = true
        okeyButton.isHidden = true
    }
    func setUpButton() {
        okeyButton.layer.cornerRadius = 32
        okeyButton.setTitleColor(.black, for: .normal)
        okeyButton.addShadow(shadowColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor,
                         shadowOffset: CGSize(width: 0, height: 0),
                         shadowRadius: 9.1,
                         shadowOpacity: 0.5)
    }
    func isInternetAvailable() {
        let reachability = try! Reachability()
        
        if reachability.connection != .unavailable {
            self.percentageLabel.text = "40%"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.percentageLabel.text = "100%"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.percentageLabel.isHidden = true
                self.ckeckMarkImage.isHidden = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                AppDelegate.shared.goToMain(controller: AppDelegate.shared.openMainApp())
            }
        }
        else {
            noConLabel.isHidden = false
            okeyButton.isHidden = false
            percentageLabel.text = ":("
        }
    }
}
