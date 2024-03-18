//  Created by Alexander N
//


import UIKit

enum configsldmflsdfsdfldsflsdlfdsflView {
    case first,second,transaction
}

protocol ReusableViewEvent : AnyObject {
    func jjnghbytyruehjdhvjvndnbshwteyudjd(config: configsldmflsdfsdfldsflsdlfdsflView)
}

struct ReudssabdledVdfivewrMwodesl {
    var title : String
    var items : [ReusdadbflevContfentCfffsell]
}

struct ReusdadbflevContfentCfffsell {
    var title : String
    var image : UIImage
    var selectedImage: UIImage
}

class ReuassdableView: UIView, AnidfmatedButdftonEdfvdent {
    func onClickdfgbdfgbdfgbsdsadfadsfs() {
        self.protocolElement?.jjnghbytyruehjdhvjvndnbshwteyudjd(config: self.configView)
    }
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var titleLb: UILabel!
    @IBOutlet private weak var content: UICollectionView!
    @IBOutlet private weak var nextStepBtn: AnsimddatdedBudftton!
    @IBOutlet private weak var titleWight: NSLayoutConstraint!
    @IBOutlet private weak var buttonBottom: NSLayoutConstraint!
    
    weak var protocolElement : ReusableViewEvent?
    
    public var configView : configsldmflsdfsdfldsflsdlfdsflView = .first
    public var viewModel : ReudssabdledVdfivewrMwodesl? = nil
    private let cellName = "ReaussvcafbleCell"
    private var selectedStorage : [Int] = []
    private let multic: CGFloat = 0.94
    private let xib = "ReuassdableView"
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        Init()
    }
    
    private func Init() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        if UIDevice.current.userInterfaceIdiom == .phone {
            // Устройство является iPhone
            if UIScreen.main.nativeBounds.height >= 2436 {
                // Устройство без физической кнопки "Home" (например, iPhone X и новее)
            } else {
                // Устройство с физической кнопкой "Home"
                buttonBottom.constant = 47
            }
        } else {
            buttonBottom.constant = 63
        }

        contentView.fixInViewDDDD(self)
        nextStepBtn.delegate = self
        nextStepBtn.style = .native
        contentView.backgroundColor = .clear
        asdfsadfthrergsdfearfeferf()
        usatdufidshvbhfbjvfdss()
        qwqeqrqtqyquqiqkqjqhqgqfqdq()
        
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            let layout = RTLSupportedCollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            content.collectionViewLayout = layout
        }
    }
    
    private func asdfsadfthrergsdfearfeferf(){
        content.dataSource = self
        content.delegate = self
        content.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        content.backgroundColor = .clear
//        UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
    
    private func usatdufidshvbhfbjvfdss(){
        titleLb.sesdtShagdgffow()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        titleLb.textColor = .white
        titleLb.font = UIFont(name: Coasanfidgudrdadtdidovns.getSubFontName(), size: 24)
//        titleLb.lineBreakMode = .byWordWrapping
        titleLb.adjustsFontSizeToFitWidth = true
    }
    
    public func azjnzahbzagzafvzacza(config: configsldmflsdfsdfldsflsdlfdsflView) {
        self.configView = config
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    private func aqfraqgtaqhyaqujaqikaqjuaqyhaq(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        self.titleLb.text = viewModel?.title
    }
    
    //MARK: screen configs
    
    private func qwqeqrqtqyquqiqkqjqhqgqfqdq(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            titleWight.setValue(0.35, forKey: "multiplier")
        } else {
            titleWight.setValue(0.7, forKey: "multiplier")
        }
    }
    
    private func qzqxqcqvqbvqbqnqnqmqmqqjqhqgqfqfqgqh() -> Int {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return (viewModel?.items.count ?? 0) - 1
    }
}

extension ReuassdableView : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        aqfraqgtaqhyaqujaqikaqjuaqyhaq()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = content.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! ReaussvcafbleCell
        let content = viewModel?.items[indexPath.item]
        cell.cellLabel.text = content?.title.uppercased()
        if selectedStorage.contains(where: {$0 == indexPath.item}) {
            cell.cellLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            cell.cellImage.image = content?.selectedImage
            cell.contentContainer.backgroundColor = #colorLiteral(red: 0.7372549176, green: 0.7372549176, blue: 0.7372549176, alpha: 1)
            cell.cellLabel.font = UIFont(name: Coasanfidgudrdadtdidovns.getSubFontName(), size: 12)
            cell.cellLabel.sesdaftShadsfasaddfasdfdsafvxbxcow(with: 0.25)
        } else {
            cell.cellLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
            cell.cellImage.image = content?.image
            cell.contentContainer.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
            cell.cellLabel.font = UIFont(name: Coasanfidgudrdadtdidovns.getSubFontName(), size: 10)
            cell.cellLabel.sesdaftShadsfasaddfasdfdsafvxbxcow(with: 0.5)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedStorage.contains(where: {$0 == indexPath.item}) {
            selectedStorage.removeAll(where: {$0 == indexPath.item})
        } else {
            selectedStorage.append(indexPath.row)
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
       
        UIApplication.shared.impactFeedbackGeneratorRDRRDD(type: .light)
        collectionView.reloadData()
        collectionView.performBatchUpdates(nil, completion: nil)
        if indexPath.last == qzqxqcqvqbvqbqnqnqmqmqqjqhqgqfqfqgqh() {
            collectionView.scrollToLastItemDDDSDS(animated: false)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return selectedStorage.contains(indexPath.row) ? CGSize(width: collectionView.frame.height * 0.8, height: collectionView.frame.height) : CGSize(width: collectionView.frame.height * 0.7, height: collectionView.frame.height * 0.85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
}

class RTLSupportedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}
