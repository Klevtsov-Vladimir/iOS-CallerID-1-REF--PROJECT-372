
import Foundation
import StoreKit
import Pushwoosh
import Adjust

protocol IAPManasdcagerProtosacol: AnyObject {
    func infoAlertasdfasdfvbxxcvbdfghdfgh(title: String, message: String)
    func rtrtrgoTerterertoTheAsaertetrtdfasfpdsafp()
    func fnvjfvnfjnvfjvnfjvvfjvnfjvnfjvnfjvnfjvicjdsc()
}

class IAASSFPManvdager: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    static let sharedTRTT = IAASSFPManvdager()
    weak var  transactionsDelegate: IAPManasdcagerProtosacol?
    
    public var  localizablePriceEEDFD = "$4.99"
    public var productBuyERTET : PdjkhsbfgjadsfkhvlsdfremiumMainCogdbfnntrollmjmklokoperStyle = .madsfidsnfPrdodfucddfdfdt
    public var productBought: [PdjkhsbfgjadsfkhvlsdfremiumMainCogdbfnntrollmjmklokoperStyle] = []
    
    private var inMainSDFSD: SKProduct?
    private var inUnlockContentSDFS: SKProduct?
    private var inUnlockFuncSDFSDF: SKProduct?
    private var inUnlockOtherSDFFS: SKProduct?
    
    private var mainProductSDF = Coasanfidgudrdadtdidovns.mainSubscriptionIDVCA
    private var spamProductFSDFS = Coasanfidgudrdadtdidovns.spamSubscriptionID
    private var unlockContentProductSDFSDF = Coasanfidgudrdadtdidovns.unlockContentSubscriptionIDERER
    private var unlockFuncProduct = Coasanfidgudrdadtdidovns.unlockFuncSubscriptionIDEWW
    private var unlockOtherSDFSD = Coasanfidgudrdadtdidovns.unlockerThreeSubscriptionIDVCS
    
    private var secretKeySDF = Coasanfidgudrdadtdidovns.subscriptionSharedSecret
    
    private var isRestoreTransactionFSDF = true
    private var restoringTransactionProductIdFSDFDS: [String] = []
    
    private let iapErrorFFSD      = NSLocalizedString("error_iap", comment: "")
    private let prodIDErrorFSDFS   = NSLocalizedString("inval_prod_id", comment: "")
    private let restoreErrorSDFD  = NSLocalizedString("faledRestore", comment: "")
    private let purchaseErrorSDF = NSLocalizedString("notPurchases", comment: "")
    
    public func loadProductsFuncSDFSDF() {
        SKPaymentQueue.default().add(self)
        let request = SKProductsRequest(productIdentifiers:[mainProductSDF,unlockContentProductSDFSDF,unlockOtherSDFSD, spamProductFSDFS])
        request.delegate = self
        request.start()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
    }
    
    
    public func doPurchaseFSD() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
        switch productBuyERTET {
        case .madsfidsnfPrdodfucddfdfdt:
            processPurchaseSDFD(for: inMainSDFSD, with: Coasanfidgudrdadtdidovns.mainSubscriptionIDVCA)
        case .eiwgyrtidvbhiir:
            processPurchaseSDFD(for: inUnlockContentSDFS, with: Coasanfidgudrdadtdidovns.unlockContentSubscriptionIDERER)
        case .spamProduct:
            processPurchaseSDFD(for: inUnlockFuncSDFSDF, with: Coasanfidgudrdadtdidovns.spamSubscriptionID)
        case .unlockOther:
            processPurchaseSDFD(for: inUnlockOtherSDFFS, with: Coasanfidgudrdadtdidovns.unlockerThreeSubscriptionIDVCS)
        }
    }
    
    public func lasodcalsiszsdddvedPriceXXX() -> String {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        guard NetworkStatusMonitor.sharedFFFR.isNetworkAvailable else { return localizablePriceEEDFD }
        switch productBuyERTET {
          case .madsfidsnfPrdodfucddfdfdt:
            processProductPriceSADSAD(for: inMainSDFSD)
          case .eiwgyrtidvbhiir:
            processProductPriceSADSAD(for: inUnlockContentSDFS)
          case .spamProduct:
            processProductPriceSADSAD(for: inUnlockFuncSDFSDF)
        case .unlockOther:
            processProductPriceSADSAD(for: inUnlockOtherSDFFS)
        }
        return localizablePriceEEDFD
    }
    
    private func getCurrentProductSDFSD() -> SKProduct? {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        switch productBuyERTET {
        case .madsfidsnfPrdodfucddfdfdt:
            return self.inMainSDFSD
        case .eiwgyrtidvbhiir:
            return self.inUnlockContentSDFS
        case .spamProduct:
            return self.inUnlockFuncSDFSDF
        case .unlockOther:
            return self.inUnlockOtherSDFFS
        }
    }
    
    private func processPurchaseSDFD(for product: SKProduct?, with configurationId: String) {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        guard let product = product else {
            self.transactionsDelegate?.infoAlertasdfasdfvbxxcvbdfghdfgh(title: iapErrorFFSD, message: prodIDErrorFSDFS)
            return
        }
        if product.productIdentifier.isEmpty {
            
            self.transactionsDelegate?.infoAlertasdfasdfvbxxcvbdfghdfgh(title: iapErrorFFSD, message: prodIDErrorFSDFS)
        } else if product.productIdentifier == configurationId {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
    }
    
    
    public func doRestoreSDF() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        guard isRestoreTransactionFSDF else { return }
        SKPaymentQueue.default().restoreCompletedTransactions()
        isRestoreTransactionFSDF = false
    }
    
    
    private func completeRestoredStatusFuncEDSD(restoreProductID : String, transaction: SKPaymentTransaction) {
        if restoringTransactionProductIdFSDFDS.contains(restoreProductID) { return }
        restoringTransactionProductIdFSDFDS.append(restoreProductID)
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        vaasliddatbfeSubdfsscrisptsdionWithCompletionHandlerSDDSDS(productIdentifier: restoreProductID) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.restoringTransactionProductIdFSDFDS.removeAll {$0 == restoreProductID}
            if result {
                
                if let mainProd = self.inMainSDFSD, restoreProductID == mainProd.productIdentifier {
                    self.transactionsDelegate?.rtrtrgoTerterertoTheAsaertetrtdfasfpdsafp()
                    self.trackSubscriptionASADAS(transaction: transaction, product: mainProd)
                    
                }
                else if let firstProd = self.inUnlockFuncSDFSDF, restoreProductID == firstProd.productIdentifier {
                    self.trackSubscriptionASADAS(transaction: transaction, product: firstProd)
                    
                }
                else if let unlockContent = self.inUnlockContentSDFS, restoreProductID == unlockContent.productIdentifier {
                    self.trackSubscriptionASADAS(transaction: transaction, product: unlockContent)
                    
                }
            } else {
                self.transactionsDelegate?.infoAlertasdfasdfvbxxcvbdfghdfgh(title: self.restoreErrorSDFD, message: self.purchaseErrorSDF)
            }
        }
    }
    
    
    public func completeAllTransactionsFuncSDSD() {
        let transactions = SKPaymentQueue.default().transactions
        for transaction in transactions {
            let transactionState = transaction.transactionState
            if transactionState == .purchased || transactionState == .restored {
                SKPaymentQueue.default().finishTransaction(transaction)
            }
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
        }
    }
    
    // Ваша собственная функция для проверки подписки.
    public func vaasliddatbfeSubdfsscrisptsdionWithCompletionHandlerSDDSDS(productIdentifier: String,_ resultExamination: @escaping (Bool) -> Void) {
        SKReceiptRefreshRequest().start()
        
        guard let receiptUrl = Bundle.main.appStoreReceiptURL,
              let receiptData = try? Data(contentsOf: receiptUrl) else {
            pushwooshSetSubTagDDADS(value: false)
            resultExamination(false)
            return
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
        let receiptDataString = receiptData.base64EncodedString(options: [])
        
        let jsonRequestBody: [String: Any] = [
            "receipt-data": receiptDataString,
            "password": self.secretKeySDF,
            "exclude-old-transactions": true
        ]
        
        let requestData: Data
        do {
            requestData = try JSONSerialization.data(withJSONObject: jsonRequestBody)
        } catch {
            print("Failed to serialize JSON: \(error)")
            pushwooshSetSubTagDDADS(value: false)
            resultExamination(false)
            return
        }
#warning("replace to release")
        //#if DEBUG
        let url = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
        //#else
        //        let url = URL(string: "https://buy.itunes.apple.com/verifyReceipt")!
        //#endif
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestData
       
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print("Failed to validate receipt: \(error) IAPManager")
                self?.pushwooshSetSubTagDDADS(value: false)
                resultExamination(false)
                return
            }
            
            guard let data = data else {
                print("No data received from receipt validation IAPManager")
                self?.pushwooshSetSubTagDDADS(value: false)
                resultExamination(false)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let latestReceiptInfo = json["latest_receipt_info"] as? [[String: Any]] {
                    for receipt in latestReceiptInfo {
                        if let receiptProductIdentifier = receipt["product_id"] as? String,
                           receiptProductIdentifier == productIdentifier,
                           let expiresDateMsString = receipt["expires_date_ms"] as? String,
                           let expiresDateMs = Double(expiresDateMsString) {
                            let expiresDate = Date(timeIntervalSince1970: expiresDateMs / 1000)
                            if expiresDate > Date() {
                                DispatchQueue.main.async {
                                    self?.pushwooshSetSubTagDDADS(value: true)
                                    resultExamination(true)
                                }
                                return
                            }
                        }
                    }
                }
            } catch {
                print("Failed to parse receipt data 🔴: \(error) IAPManager")
            }
            
            DispatchQueue.main.async {
                self?.pushwooshSetSubTagDDADS(value: false)
                resultExamination(false)
            }
        }
        task.resume()
    }
    
    
    func validateSubscriptionsSADASA(productIdentifiers: [String], completion: @escaping ([String: Bool]) -> Void) {
        var results = [String: Bool]()
        let dispatchGroup = DispatchGroup()
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        
        for productIdentifier in productIdentifiers {
            dispatchGroup.enter()
            vaasliddatbfeSubdfsscrisptsdionWithCompletionHandlerSDDSDS(productIdentifier: productIdentifier) { isValid in
                results[productIdentifier] = isValid
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(results)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        Pushwoosh.sharedInstance().sendSKPaymentTransactions(transactions)
        for transaction in transactions {
            if let error = transaction.error as NSError?, error.domain == SKErrorDomain {
                switch error.code {
                case SKError.paymentCancelled.rawValue:
                    print("User cancelled the request IAPManager")
                case SKError.paymentNotAllowed.rawValue, SKError.paymentInvalid.rawValue, SKError.clientInvalid.rawValue, SKError.unknown.rawValue:
                    print("This device is not allowed to make the payment IAPManager")
                default:
                    break
                }

            }
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
            
            switch transaction.transactionState {
            case .purchased:
                if let product = getCurrentProductSDFSD() {
                    if productBuyERTET != .madsfidsnfPrdodfucddfdfdt {
                        DatabaseManager.shared.checkChanged()
                        UserDefaults.standard.set(true, forKey: "launchedBefore")
                        UserDefaults.standard.set(Date(), forKey: "featchFirebaseStart")
                        UserDefaults.standard.set(true, forKey: "isHaveUnlockContentSubscriptionID")
                        
                        trackSubscriptionASADAS(transaction: transaction, product: product)
                        
                        NotificationCenter.default.post(name: NSNotification.Name("checkSpamPur"), object: nil)
                    }
                    if transaction.payment.productIdentifier == product.productIdentifier {
                        SKPaymentQueue.default().finishTransaction(transaction)
                        trackSubscriptionASADAS(transaction: transaction, product: product)
                        transactionsDelegate?.rtrtrgoTerterertoTheAsaertetrtdfasfpdsafp()
                    }
                    
                }
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                
                print("Failed IAPManager")
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                completeRestoredStatusFuncEDSD(restoreProductID: transaction.payment.productIdentifier, transaction: transaction)
                
            case .purchasing, .deferred:
                print("Purchasing IAPManager")
                
            default:
                print("Default IAPManager")
            }
        }
        completeAllTransactionsFuncSDSD()
    }
    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("requesting to product IAPManager")
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        if let invalidIdentifier = response.invalidProductIdentifiers.first {
            print("Invalid product identifier:", invalidIdentifier , "IAPManager")
        }
        
        guard !response.products.isEmpty else {
            print("No products available IAPManager")
            return
        }
        
        response.products.forEach({ productFromRequest in
            switch productFromRequest.productIdentifier {
            case Coasanfidgudrdadtdidovns.mainSubscriptionIDVCA:
                inMainSDFSD = productFromRequest
            case Coasanfidgudrdadtdidovns.unlockContentSubscriptionIDERER:
                inUnlockContentSDFS = productFromRequest
            case Coasanfidgudrdadtdidovns.spamSubscriptionID:
                inUnlockFuncSDFSDF = productFromRequest
            case Coasanfidgudrdadtdidovns.unlockerThreeSubscriptionIDVCS:
                inUnlockOtherSDFFS = productFromRequest
            default:
                print("error IAPManager")
                return
            }
            print("Found product: \(productFromRequest.productIdentifier) IAPManager")
        })
    }
    
    private func processProductPriceSADSAD(for product: SKProduct?) {
        guard let product = product else {
            self.localizablePriceEEDFD = "4.99 $"
            return
        }
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = product.priceLocale
        
        if let formattedPrice = numberFormatter.string(from: product.price) {
            self.localizablePriceEEDFD = "\(product.price) $"
        } else {
            self.localizablePriceEEDFD = "4.99 $"
        }
    }
    
    private func pushwooshSetSubTagDDADS(value : Bool) {
        
        var tag = Coasanfidgudrdadtdidovns.mainSubscriptionPushTagDSS
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        switch productBuyERTET {
        case .madsfidsnfPrdodfucddfdfdt:
            print("continue IAPManager")
        case .eiwgyrtidvbhiir:
            tag = Coasanfidgudrdadtdidovns.unlockContentSubscriptionPushTagCXS
        case .spamProduct:
            tag = Coasanfidgudrdadtdidovns.unlockFuncSubscriptionPushTagWEWE
        case .unlockOther:
            tag = Coasanfidgudrdadtdidovns.unlockerThreeSubscriptionPushTagTRTRD
        }
        
        Pushwoosh.sharedInstance().setTags([tag: value]) { error in
            if let err = error {
                print(err.localizedDescription)
                print("send tag error IAPManager")
            }
        }
    }
    
    private func trackSubscriptionASADAS(transaction: SKPaymentTransaction, product: SKProduct) {
        if let receiptURL = Bundle.main.appStoreReceiptURL,
           let receiptData = try? Data(contentsOf: receiptURL) {
            let a = 1 + 3
            
            for i in 0...100 {
                print(i)
            }
            
            let price = NSDecimalNumber(decimal: product.price.decimalValue)
            let currency = product.priceLocale.currencyCode ?? "USD"
            let transactionId = transaction.transactionIdentifier ?? ""
            let transactionDate = transaction.transactionDate ?? Date()
            let salesRegion = product.priceLocale.regionCode ?? "US"
            
            if let subscription = ADJSubscription(price: price, currency: currency, transactionId: transactionId, andReceipt: receiptData) {
                subscription.setTransactionDate(transactionDate)
                subscription.setSalesRegion(salesRegion)
                Adjust.trackSubscription(subscription)
            }
        }
    }
}
