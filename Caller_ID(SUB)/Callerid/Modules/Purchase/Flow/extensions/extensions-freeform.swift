//  Created by Alexander N
//


import Foundation
import UIKit


extension UIView {
    public func fixInViewDDDD(_ container: UIView!) -> Void{
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    public func onClickRFFR(target: Any, _ selector: Selector) {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: selector)
        addGestureRecognizer(tap)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    public  func roundCornersSDASD(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    public  var renderedImage: UIImage {
        // rect of capure
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        let rect = self.bounds
        
        // create the context of bitmap
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        self.layer.render(in: context)
        // self.layer.render(in: context)
        // get a image from current context bitmap
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
    
    public func fadeInRFDFD(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        self.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: { [weak self] in
            self?.isHidden = false
            self?.alpha = 1.0
        }, completion: completion)
    }
    
    public  func fadeOutERDFSD(duration: TimeInterval = 1.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        self.alpha = 1.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: { [weak self] in
            self?.isHidden = true
            self?.alpha = 0.0
        }, completion: completion)
    }
    
    public func drawBorderRRRDDD(edges: [UIRectEdge], borderWidth: CGFloat, color: UIColor, margin: CGFloat) {
        for item in edges {
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
            let borderLayer: CALayer = CALayer()
            borderLayer.borderColor = color.cgColor
            borderLayer.borderWidth = borderWidth
            switch item {
            case .top:
                borderLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: borderWidth)
            case .left:
                borderLayer.frame =  CGRect(x: 0, y: margin, width: borderWidth, height: frame.height - (margin*2))
            case .bottom:
                borderLayer.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
            case .right:
                borderLayer.frame = CGRect(x: frame.width - borderWidth, y: margin, width: borderWidth, height: frame.height - (margin*2))
            case .all:
                drawBorderRRRDDD(edges: [.top, .left, .bottom, .right], borderWidth: borderWidth, color: color, margin: margin)
            default:
                break
            }
            self.layer.addSublayer(borderLayer)
        }
    }
}

extension UILabel {
    func sesdtShagdgffow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func sesdaftShadsfasaddfasdfdsafvxbxcow(with opacity: Float = 1.0){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
}

extension String {
    var udnsfddesdrfLidsfsdnfedsfsdfvgd: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
extension String {
    func opesdfnUfRdLfvv(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if let url = URL(string: self) {
            UIApplication.shared.impactFeedbackGeneratorRDRRDD(type: .medium)
            UIApplication.shared.open(url)
        }
    }
}

extension UIApplication {
   func setDFSDFSDFVRRwRootVC(_ vc : UIViewController){
       let a = 1 + 3
       
       for i in 0...100 {
           print(i)
       }
       self.windows.first?.rootViewController = vc
       self.windows.first?.makeKeyAndVisible()
     }
 }


extension UIApplication {
    func notificationFeedbackGeneratorXXXXS(type : UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func impactFeedbackGeneratorRDRRDD(type : UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: type)
        generator.impactOccurred()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
}

extension UIApplication {
    func isIpdsfgsdglad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return false
    }
}
extension UICollectionView {
    func scrollToLastItemDDDSDS(at scrollPosition: UICollectionView.ScrollPosition = .centeredHorizontally, animated: Bool = true) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        let lastSection = numberOfSections - 1
        guard lastSection >= 0 else { return }
        let lastItem = numberOfItems(inSection: lastSection) - 1
        guard lastItem >= 0 else { return }
        let lastItemIndexPath = IndexPath(item: lastItem, section: lastSection)
        scrollToItem(at: lastItemIndexPath, at: scrollPosition, animated: animated)
    }
}
