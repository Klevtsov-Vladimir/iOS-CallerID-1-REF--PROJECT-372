import UIKit
import AVKit
import AVFoundation
import SnapKit

enum PdjkhsbfgjadsfkhvlsdfremiumMainCogdbfnntrollmjmklokoperStyle {
    case madsfidsnfPrdodfucddfdfdt,eiwgyrtidvbhiir,unlockOther, spamProduct
}

class PresmisumMcaidndCofntfrsoller: UIViewController {
    
    private var playerLayerXXXRR : AVPlayerLayer!
    private var view0RFRD = ReuassdableView()
    private var view1DDDDD = ReuassdableView()
    private var viewTransactionTGFTF = TradfdndsDSFsactionView()
    
    @IBOutlet private weak var freeformRRRRSS: UIView!
    @IBOutlet private weak var videoElementXXDXD: UIView!
    @IBOutlet private weak var restoreBtnFFGGF: UIButton!
    @IBOutlet weak var closeBtnTTRRTF: UIButton!
    
    public var productBuyFDFDD : PdjkhsbfgjadsfkhvlsdfremiumMainCogdbfnntrollmjmklokoperStyle = .madsfidsnfPrdodfucddfdfdt
    
    private var intScreenStatusFFD = 0
    private var avPlayerXXXS: AVPlayer? = AVPlayer()
    
    init(prod: PdjkhsbfgjadsfkhvlsdfremiumMainCogdbfnntrollmjmklokoperStyle) {
        super.init(nibName: nil, bundle: nil)
        
        self.productBuyFDFDD = prod
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
    }
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isdnfsdiftVidfefvoElgeggment()
        stwearetMewakewedewXewewXX()
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !NetworkStatusMonitor.sharedFFFR.isNetworkAvailable {
            shovvwrMrersfsbny()
        }
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    override  func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deinitOperationCDCD()
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    override  func viewDidDisappear(_ animated: Bool) {
        chageScreenStatusRR()
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    deinit {
        deinitOperationCDCD()
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    private func isdnfsdiftVidfefvoElgeggment(){
        DispatchQueue.main.asyncAfter(deadline: .now()) { [self] in
            BGPlayerRR()
        }
        
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    
    //MARK: System events
    
    private func deinitOperationCDCD(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        intScreenStatusFFD = 1
        avPlayerXXXS?.pause()
        avPlayerXXXS?.replaceCurrentItem(with: nil)
        if playerLayerXXXRR != nil {
            playerLayerXXXRR.player = nil
        }
        avPlayerXXXS = nil
        playerLayerXXXRR = nil
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: AVAudioSession.interruptionNotification, object: nil)
    }
    
    private func chageScreenStatusRR(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        intScreenStatusFFD = 1
        avPlayerXXXS?.pause()
    }
    
    
    
    // MARK: - Setup Video Player
    
    private func BGPlayerRR(){
        var pathUrl = Bundle.main.url(forResource: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.nameFileVideoForPhone, withExtension: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.videoFileType)
        if UIDevice.current.userInterfaceIdiom == .pad {
            pathUrl = Bundle.main.url(forResource: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.nameFileVideoForPad, withExtension: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.videoFileType)
        }else{
            pathUrl = Bundle.main.url(forResource: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.nameFileVideoForPhone, withExtension: ConfigurationMedawjnfknafjkasndafnadsfkjasdlfadiaSub.videoFileType)
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
        avPlayerXXXS = AVPlayer(url: pathUrl!)
        playerLayerXXXRR = AVPlayerLayer(player: avPlayerXXXS)
        playerLayerXXXRR.frame = self.view.layer.bounds
        if UIDevice.current.userInterfaceIdiom == .pad{
            playerLayerXXXRR.videoGravity = .resizeAspectFill
        }else{
            playerLayerXXXRR.videoGravity = .resize
        }
        self.videoElementXXDXD.layer.addSublayer(playerLayerXXXRR)
        avPlayerXXXS?.play()
        
        if let avPlayerXXXS {
            loopVideoMBSSS(videoPlayer: avPlayerXXXS)
        }
        addPlayerNotificationsXXXX()
}
    
    private func addPlayerNotificationsXXXX() {
        NotificationCenter.default.addObserver(self, selector: #selector(plasysesrdIdtemdDdidfPfleaeyeToEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(asdpplicadtdionfWiflflfEvnrtrerrFowrsesgsround), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(apdpflicatyigogndeDeidEfngtehrBgagcfkffground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hsdfsdafnsddflsdefsdfsdfIsdnfvxctfevrrrrurpeeteieon(notification:)), name: AVAudioSession.interruptionNotification, object: nil)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    private func loopVideoMBSSS(videoPlayer:AVPlayer){
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: .zero)
            videoPlayer.play()
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
        }
    }
    
    @objc func hsdfsdafnsddflsdefsdfsdfIsdnfvxctfevrrrrurpeeteieon(notification: Notification) {
        guard let info = notification.userInfo,
              let typeValue = info[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if type == .began {
            // Interruption began, take appropriate actions (save state, update user interface)
            self.avPlayerXXXS?.pause()
        } else if type == .ended {
            guard let optionsValue =
                    info[AVAudioSessionInterruptionOptionKey] as? UInt else {
                return
            }
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            if options.contains(.shouldResume) {
                // Interruption Ended - playback should resume
                self.avPlayerXXXS?.play()
            }
        }
    }
    
    // Player end.
    @objc  private func plasysesrdIdtemdDdidfPfleaeyeToEnd(_ notification: Notification) {
        // Your Code.
        if intScreenStatusFFD == 0{
            avPlayerXXXS?.seek(to: CMTime.zero)
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    //App enter in forground.
    @objc private func asdpplicadtdionfWiflflfEvnrtrerrFowrsesgsround(_ notification: Notification) {
        if intScreenStatusFFD == 0 {
            avPlayerXXXS?.play()
        } else {
            avPlayerXXXS?.pause()
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    //App enter in forground.
    @objc private func apdpflicatyigogndeDeidEfngtehrBgagcfkffground(_ notification: Notification) {
        avPlayerXXXS?.pause()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    // MARK: - Make UI/UX
    
    private func stwearetMewakewedewXewewXX(){
        ertyvcbrtfgsdfgstrgd()
        if productBuyFDFDD == .madsfidsnfPrdodfucddfdfdt {
            dsfsetdfdReufsfasdfdfbleXsfdXX(config: .first, isHide: false)
            dsfsetdfdReufsfasdfdfbleXsfdXX(config: .second, isHide: true)
            lsdakfhjkadsjfdklsaf(isHide: true)
        } else {
            lsdakfhjkadsjfdklsaf(isHide: false)
            self.dkjfeiurjfncmnvfjhdhjd()
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
    }
    
    //reusable setup
    
    private func generateContentForViewXRXR(config: configsldmflsdfsdfldsflsdlfdsflView) -> [ReusdadbflevContfentCfffsell] {
        var contentForCV : [ReusdadbflevContfentCfffsell] = []
        switch config {
        case .first:
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text1ID"), image: UIImage(named: "2_1desZXCVB")!, selectedImage: UIImage(named: "2_1selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text2ID"), image: UIImage(named: "2_2desZXCVB")!, selectedImage: UIImage(named: "2_2selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text3ID"), image: UIImage(named: "2_3desZXCVB")!, selectedImage: UIImage(named: "2_3selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text4ID"), image: UIImage(named: "2_4desZXCVB")!, selectedImage: UIImage(named: "2_4selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text5ID"), image: UIImage(named: "2_5desZXCVB")!, selectedImage: UIImage(named: "2_5selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text1ID"), image: UIImage(named: "2_1desZXCVB")!, selectedImage: UIImage(named: "2_1selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text2ID"), image: UIImage(named: "2_2desZXCVB")!, selectedImage: UIImage(named: "2_2selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text3ID"), image: UIImage(named: "2_3desZXCVB")!, selectedImage: UIImage(named: "2_3selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text4ID"), image: UIImage(named: "2_4desZXCVB")!, selectedImage: UIImage(named: "2_4selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text5ID"), image: UIImage(named: "2_5desZXCVB")!, selectedImage: UIImage(named: "2_5selZXCVB")!))
            return contentForCV
        case .second:
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text1ID"), image: UIImage(named: "2_1desZXCVB")!, selectedImage: UIImage(named: "2_1selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text2ID"), image: UIImage(named: "2_2desZXCVB")!, selectedImage: UIImage(named: "2_2selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text3ID"), image: UIImage(named: "2_3desZXCVB")!, selectedImage: UIImage(named: "2_3selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text4ID"), image: UIImage(named: "2_4desZXCVB")!, selectedImage: UIImage(named: "2_4selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text5ID"), image: UIImage(named: "2_5desZXCVB")!, selectedImage: UIImage(named: "2_5selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text1ID"), image: UIImage(named: "2_1desZXCVB")!, selectedImage: UIImage(named: "2_1selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text2ID"), image: UIImage(named: "2_2desZXCVB")!, selectedImage: UIImage(named: "2_2selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text3ID"), image: UIImage(named: "2_3desZXCVB")!, selectedImage: UIImage(named: "2_3selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text4ID"), image: UIImage(named: "2_4desZXCVB")!, selectedImage: UIImage(named: "2_4selZXCVB")!))
            contentForCV.append(ReusdadbflevContfentCfffsell(title: eiorieorieoriefndjfndjfhjshdjs(forKey:"Text5ID"), image: UIImage(named: "2_5desZXCVB")!, selectedImage: UIImage(named: "2_5selZXCVB")!))
            return contentForCV
        case .transaction: return contentForCV
        }
    }
    
    private func dsfsetdfdReufsfasdfdfbleXsfdXX(config : configsldmflsdfsdfldsflsdlfdsflView, isHide : Bool){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        var currentView : ReuassdableView? = nil
        var viewModel : ReudssabdledVdfivewrMwodesl? = nil
        switch config {
        case .first:
            viewModel =  ReudssabdledVdfivewrMwodesl(title: eiorieorieoriefndjfndjfhjshdjs(forKey: "TextTitle1ID").uppercased(), items: self.generateContentForViewXRXR(config: config))
            currentView = self.view0RFRD
        case .second:
            viewModel =  ReudssabdledVdfivewrMwodesl(title: eiorieorieoriefndjfndjfhjshdjs(forKey: "TextTitle2ID").uppercased(), items: self.generateContentForViewXRXR(config: config))
            currentView = self.view1DDDDD
        case .transaction:
            currentView = nil
        }
        guard let i = currentView else { return }
        i.protocolElement = self
        i.viewModel = viewModel
        i.configView = config
        freeformRRRRSS.addSubview(i)
        freeformRRRRSS.bringSubviewToFront(i)
        
        i.snp.makeConstraints { make in
            make.height.equalTo(338)
            make.width.equalTo(freeformRRRRSS).multipliedBy(1)
            make.centerX.equalTo(freeformRRRRSS).multipliedBy(1)
            make.bottom.equalTo(freeformRRRRSS).offset(0)
        }
        i.isHidden = isHide
    }
    //transaction setup
    
    private func lsdakfhjkadsjfdklsaf( isHide : Bool) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        self.viewTransactionTGFTF.inApp.productBuyERTET = self.productBuyFDFDD
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.viewTransactionTGFTF.setLocavnvhrjdkdlization_TOC()
        }
        freeformRRRRSS.addSubview(self.viewTransactionTGFTF)
        freeformRRRRSS.bringSubviewToFront(self.viewTransactionTGFTF)
        self.viewTransactionTGFTF.inApp.productBuyERTET = self.productBuyFDFDD
        self.viewTransactionTGFTF.snp.makeConstraints { make in
//            make.height.equalTo(338)
            make.width.equalTo(freeformRRRRSS).multipliedBy(1)
            make.centerX.equalTo(freeformRRRRSS).multipliedBy(1)
            make.bottom.equalTo(freeformRRRRSS).offset(0)
        }
        self.viewTransactionTGFTF.isHidden = isHide
        self.viewTransactionTGFTF.delegateGTGT = self
        
        viewTransactionTGFTF.sdsfegtsdfPgsdfgrsdfgodfgd(prod: self.productBuyFDFDD)
    }
    
    // restore button setup
    
    private func ertyvcbrtfgsdfgstrgd(){
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        self.restoreBtnFFGGF.isHidden = true
        self.restoreBtnFFGGF.setTitle(eiorieorieoriefndjfndjfhjshdjs(forKey: "restore"), for: .normal)
        self.restoreBtnFFGGF.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 22)
        self.restoreBtnFFGGF.titleLabel?.sesdtShagdgffow()
        self.restoreBtnFFGGF.tintColor = .white
        self.restoreBtnFFGGF.setTitleColor(.white, for: .normal)
    }
    
    private func gfdsgertsgjjuyrropfoifihfdbd() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        avPlayerXXXS?.pause()
        avPlayerXXXS = nil
        playerLayerXXXRR = nil
        UIApplication.shared.notificationFeedbackGeneratorXXXXS(type: .success)
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        print(NotificationCenter.default.observationInfo)
        if productBuyFDFDD == .madsfidsnfPrdodfucddfdfdt {
            AppDelegate.shared.gosdfTodsMfsdafsdfisdfdsfsdfn(csodfndsfsdtfsdrfvvvoller: LoaderController())
        } else {
            AppDelegate.shared.gosdfTodsMfsdafsdfisdfdsfsdfn(csodfndsfsdtfsdrfvvvoller: TabBarController(selectedIndexT: 1))
        }
    }
    
    private func dkjfeiurjfncmnvfjhdhjd(){
        self.restoreBtnFFGGF.isHidden = false
        if productBuyFDFDD != .madsfidsnfPrdodfucddfdfdt {
            self.closeBtnTTRRTF.isHidden = false
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    @IBAction func vsdgvdsgdhhhrhjrtytyghfndndnnd(_ sender: UIButton) {
        self.viewTransactionTGFTF.cvxzfsdgdsfgbvxcsgrdfg()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    @IBAction func qwaszxdfcvertyghbn(_ sender: UIButton) {
        dismiss(animated: true)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
}

extension PresmisumMcaidndCofntfrsoller : ReusableViewEvent {
    func jjnghbytyruehjdhvjvndnbshwteyudjd(config: configsldmflsdfsdfldsflsdlfdsflView) {
        switch config {
        case .first:
            self.view0RFRD.fadeOutERDFSD()
            self.view1DDDDD.fadeInRFDFD()
            UIApplication.shared.impactFeedbackGeneratorRDRRDD(type: .medium)
            ThirdPartyServicesASDccManager.sharsdsded.amsmdnhhcggcgdhwhjwjwtrtyuiuytghjhgfhj()
        case .second:
            self.view1DDDDD.fadeOutERDFSD()
            self.viewTransactionTGFTF.fadeInRFDFD()
            self.dkjfeiurjfncmnvfjhdhjd()
//            self.viewTransaction.title.restartpageControl()
            UIApplication.shared.impactFeedbackGeneratorRDRRDD(type: .medium)
        case .transaction: break
        }
    }
}

extension PresmisumMcaidndCofntfrsoller: NeastwofrvkvStadtdussMonsistodrDdeldegate {
    func shovvwrMrersfsbny() {
        tdsrasndsacstisodndTrgeatgmgerent_TOC(title: NSLocalizedString( "ConnectivityTitle", comment: ""), message: NSLocalizedString("ConnectivityDescription", comment: ""))
    }
}

extension PresmisumMcaidndCofntfrsoller : TradnsdsactsioddsnVdiwedwfEvfenfts {
    func usdsfersdSufbstctrirbrerd() {
        deinitOperationCDCD()
        self.gfdsgertsgjjuyrropfoifihfdbd()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func tdsrasndsacstisodndTrgeatgmgerent_TOC(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        UIApplication.shared.notificationFeedbackGeneratorXXXXS(type: .warning)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func trsdandsfactffionFfailfffefvd() {
        print(#function)
        UIApplication.shared.notificationFeedbackGeneratorXXXXS(type: .error)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func pdrifvafcyfOfffpfeffnff() {
        Coasanfidgudrdadtdidovns.policyLinkCCV.opesdfnUfRdLfvv()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    func rtterrmrsrOrrpttterrrn() {
        Coasanfidgudrdadtdidovns.termsLinkERE.opesdfnUfRdLfvv()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
}



