import UIKit

public protocol NibDesignableProtocol: NSObjectProtocol {
    /**
     Identifies the view that will be the superview of the contents loaded from
     the Nib. Referenced in setupNib().
     
     - returns: Superview for Nib contents.
     */
    var nibContainerView: UIView { get }
    // MARK: - Nib loading
    
    /**
     Called to load the nib in setupNib().
     
     - returns: UIView instance loaded from a nib file.
     */
    func loadNib() -> UIView
    /**
     Called in the default implementation of loadNib(). Default is class name.
     
     - returns: Name of a single view nib file.
     */
    func nibName() -> String
}

extension NibDesignableProtocol {
    // MARK: - Nib loading
    
    /**
     Called to load the nib in setupNib().
     
     - returns: UIView instance loaded from a nib file.
     */
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName(), bundle: bundle)
        let m_view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView // swiftlint:disable:this force_cast
        return m_view
    }
    
    // MARK: - Nib loading
    
    /**
     Called in init(frame:) and init(aDecoder:) to load the nib and add it as a subview.
     */
    internal func setupNib() {
        let view = loadNib()
        nibContainerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: bindings))
        nibContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: bindings))
    }
}

extension UIView {
    @objc public var nibContainerView: UIView {
        return self
    }
    
    /**
     Called in the default implementation of loadNib(). Default is class name.
     
     - returns: Name of a single view nib file.
     */
    public func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}

@IBDesignable
public class NibDesignable: UIView, NibDesignableProtocol {
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}

@IBDesignable
public class NibDesignableTableViewCell: UITableViewCell, NibDesignableProtocol {
    public override var nibContainerView: UIView {
        return contentView
    }
    
    // MARK: - Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}

@IBDesignable
public class NibDesignableTableViewHeaderFooterView: UITableViewHeaderFooterView, NibDesignableProtocol {
    
    public override var nibContainerView: UIView {
        return contentView
    }
    
    // MARK: - Initializer
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}

@IBDesignable
public class NibDesignableControl: UIControl, NibDesignableProtocol {
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}

@IBDesignable
public class NibDesignableCollectionReusableView: UICollectionReusableView, NibDesignableProtocol {
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}

@IBDesignable
public class NibDesignableCollectionViewCell: UICollectionViewCell, NibDesignableProtocol {
    override public var nibContainerView: UIView {
        return contentView
    }
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
}
