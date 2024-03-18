//  Created by Alexander N
//

import Foundation
import UIKit

class CustomPageControl: UIPageControl {

    @IBInspectable var currentPageImage: UIImage? = UIImage(named: "page_1QZXCVB")
    
    @IBInspectable var otherPagesImage: UIImage? = UIImage(named: "page_0QZXCVB")
    
    override var numberOfPages: Int {
        didSet {
            upsdfdsdadtdfsefDdodstfdssdfdfggg()
        }
    }
    
    override var currentPage: Int {
        didSet {
            upsdfdsdadtdfsefDdodstfdssdfdfggg()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if #available(iOS 14.0, *) {
            sddsfsdfdslknvlnrojnec()
        } else {
            pageIndicatorTintColor = .clear
            currentPageIndicatorTintColor = .clear
            clipsToBounds = false
        }
    }
    
    private func sddsfsdfdslknvlnrojnec() {
        if #available(iOS 14.0, *) {
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
            for index in 0..<numberOfPages {
                let image = index == currentPage ? currentPageImage : otherPagesImage
                setIndicatorImage(image, forPage: index)
            }

            // give the same color as "otherPagesImage" color.
            pageIndicatorTintColor =  .lightGray
            //
            //  rgba(209, 209, 214, 1)
            // give the same color as "currentPageImage" color.
            //
            
            currentPageIndicatorTintColor = .black
            /*
             Note: If Tint color set to default, Indicator image is not showing. So, give the same tint color based on your Custome Image.
             */
        }
    }
    
    private func upsdfdsdadtdfsefDdodstfdssdfdfggg() {
        if #available(iOS 14.0, *) {
            sddsfsdfdslknvlnrojnec()
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
        } else {
            for (index, subview) in subviews.enumerated() {
                let imageView: UIImageView
                if let existingImageview = cvnifhsubjdcbushdgfcjhsbchbjsdvbc(forSubview: subview) {
                    imageView = existingImageview
                } else {
                    imageView = UIImageView(image: otherPagesImage)
                    
                    imageView.center = subview.center
                    subview.addSubview(imageView)
                    subview.clipsToBounds = false
                }
                imageView.image = currentPage == index ? currentPageImage : otherPagesImage
            }
        }
    }
    
    private func cvnifhsubjdcbushdgfcjhsbchbjsdvbc(forSubview view: UIView) -> UIImageView? {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if let imageView = view as? UIImageView {
            return imageView
        } else {
            let view = view.subviews.first { (view) -> Bool in
                return view is UIImageView
            } as? UIImageView
            
            return view
        }
    }
}
