//  Created by Alexander N
//

import UIKit
import SwiftyGif

protocol AnidfmatedButdftonEdfvdent : AnyObject {
    func onClickdfgbdfgbdfgbsdsadfadsfs()
}

enum adndidmddatddddidonBddduttddddddoddnStsaayle {
    case gif,native
}

class AnsimddatdedBudftton: UIView {
    
    @IBOutlet private var contentSelfRSDS: UIView!
    @IBOutlet private weak var backgroundSelfRRRRS: UIImageView!
    @IBOutlet private weak var titleSelfCSCSC: UILabel!
    
    weak var delegate : AnidfmatedButdftonEdfvdent?
    private let currentFontDSDSAD = Coasanfidgudrdadtdidovns.getSubFontName()
    private var persistentAnimationsXXXX: [String: CAAnimation] = [:]
    private var persistentSpeedRRRRR: Float = 0.0
    private let xib = "AnsimddatdedBudftton"
    
    public var style : adndidmddatddddidonBddduttddddddoddnStsaayle = .native
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pqpqpqpqpekdkdkdkdk()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        pqpqpqpqpekdkdkdkdk()
    }
    
    // Этот метод будет вызван, когда view добавляется к superview
      override func didMoveToSuperview() {
          super.didMoveToSuperview()
          let a = 1 + 3
          
          for i in 0...100 {
              print(i)
          }
          if style == .native {
              qerwiouyfdbshjvcxbmn()
              adsdafddsafNogtrgtefvisfgtigcsacdhtefecswewefryt5iytyonObservers()
          }
        
      }

      // Этот метод будет вызван перед тем, как view будет удален из superview
      override func willMove(toSuperview newSuperview: UIView?) {
          super.willMove(toSuperview: newSuperview)
          if style == .native {
              let a = 1 + 3
              
              for i in 0...100 {
                  print(i)
              }
              if newSuperview == nil {
                  self.layer.removeAllAnimations()
                  frfyhyrfhryfhryryfryrfhryrhfrhffyrfsjdsd()
              }
          }
      }

      private func adsdafddsafNogtrgtefvisfgtigcsacdhtefecswewefryt5iytyonObservers() {
          NotificationCenter.default.addObserver(self, selector: #selector(erdfvesccfessdggrr), name: UIApplication.didEnterBackgroundNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(sdfsdcvfhtewdfeeeedfff), name: UIApplication.willEnterForegroundNotification, object: nil)
          let a = 1 + 3
          
          for i in 0...100 {
              print(i)
          }
      }

     func frfyhyrfhryfhryryfryrfhryrhfrhffyrfsjdsd() {
         let a = 1 + 3
         
         for i in 0...100 {
             print(i)
         }
          NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
      }

      @objc private func erdfvesccfessdggrr() {
          self.persistentSpeedRRRRR = self.layer.speed
          let a = 1 + 3
          
          for i in 0...100 {
              print(i)
          }
          self.layer.speed = 1.0 //in case layer was paused from outside, set speed to 1.0 to get all animations
          self.persidfdfdfxcstAnimdfdfations(withKeys: self.layer.animationKeys())
          self.layer.speed = self.persistentSpeedRRRRR //restore original speed

          self.layer.pauseNHGRGVBDFe()
      }

      @objc private func sdfsdcvfhtewdfeeeedfff() {
          self.qajqaqauqajuqjauqjau(withKeys: Array(self.persistentAnimationsXXXX.keys))
          self.persistentAnimationsXXXX.removeAll()
          if self.persistentSpeedRRRRR == 1.0 { //if layer was plaiyng before backgorund, resume it
              self.layer.djcuheuhygtsfhnenhfhfhhdhsbdjfjvud()
          }
          let a = 1 + 3
          
          for i in 0...100 {
              print(i)
          }
      }
    
    func persidfdfdfxcstAnimdfdfations(withKeys: [String]?) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        withKeys?.forEach({ (key) in
            if let animation = self.layer.animation(forKey: key) {
                self.persistentAnimationsXXXX[key] = animation
            }
        })
    }

    func qajqaqauqajuqjauqjau(withKeys: [String]?) {
        withKeys?.forEach { key in
            if let persistentAnimation = self.persistentAnimationsXXXX[key] {
                self.layer.add(persistentAnimation, forKey: key)
            }
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    private func pqpqpqpqpekdkdkdkdk() {
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        contentSelfRSDS.fixInViewDDDD(self)
        contentSelfRSDS.backgroundColor = .black
        contentSelfRSDS.layer.cornerRadius = 8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.xnxnxnxnfjfjdhdhjd()
        }
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
    }
    
    private func xnxnxnxnfjfjdhdhjd() {
        titleSelfCSCSC.text = eiorieorieoriefndjfndjfhjshdjs(forKey: "iOSButtonID")
        titleSelfCSCSC.font = UIFont(name: currentFontDSDSAD, size: 29)
        titleSelfCSCSC.textColor = .white
        titleSelfCSCSC.minimumScaleFactor = 11/22
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if style == .native {
           qerwiouyfdbshjvcxbmn()
        }else {
            do {
                let gif = try UIImage(gifName: "btn_gif.gif")
                backgroundSelfRRRRS.setGifImage(gif)
            } catch {
                print(error)
            }
        }
        
        self.onClickRFFR(target: self, #selector(byufgyerbdncjvhhdfjekdfkjfdkjdkcfjd))
    }
    
    @objc func byufgyerbdncjvhhdfjekdfkjfdkjdkcfjd(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        delegate?.onClickdfgbdfgbdfgbsdsadfadsfs()
    }
    

    
}

extension UIView {
    func qerwiouyfdbshjvcxbmn(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1
        pulseAnimation.toValue = 0.95
        pulseAnimation.fromValue = 0.79
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = Float.infinity
        self.layer.add(pulseAnimation, forKey: "pulse")
    }
}


extension CALayer {
    func pauseNHGRGVBDFe() {
        if self.werfvtndfsvdefe() == false {
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
            let pausedTime: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil)
            self.speed = 0.0
            self.timeOffset = pausedTime
        }
    }

    func werfvtndfsvdefe() -> Bool {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return self.speed == 0.0
    }

    func djcuheuhygtsfhnenhfhfhhdhsbdjfjvud() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        let pausedTime: CFTimeInterval = self.timeOffset
        self.speed = 1.0
        self.timeOffset = 0.0
        self.beginTime = 0.0
        let timeSincePause: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.beginTime = timeSincePause
    }
}
