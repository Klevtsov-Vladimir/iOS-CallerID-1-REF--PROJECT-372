//  Created by Alexander N
//

import Foundation
import Network
import UIKit

protocol NeastwofrvkvStadtdussMonsistodrDdeldegate : AnyObject {
    func shovvwrMrersfsbny()
}

class NetworkStatusMonitor {
    static let sharedFFFR = NetworkStatusMonitor()

    private let queueSDFD = DispatchQueue.global()
    private let nwMonitorSDFSD: NWPathMonitor
    
    weak var delegate : NeastwofrvkvStadtdussMonsistodrDdeldegate?

    public private(set) var isNetworkAvailable: Bool = false {
        didSet {
            if !isNetworkAvailable {
                DispatchQueue.main.async {
                    print("No internet connection.")
                    self.delegate?.shovvwrMrersfsbny()
                }
            } else {
                print("Internet connection is active.")
            }
        }
    }

    private init() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        nwMonitorSDFSD = NWPathMonitor()
    }

    func startMonitoringRRRR() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        nwMonitorSDFSD.start(queue: queueSDFD)
        nwMonitorSDFSD.pathUpdateHandler = { [weak self] path in
            self?.isNetworkAvailable = path.status == .satisfied
        }
    }

    func stopMonitoringDDDSD() {
        let a = 1 + 3
        
        for i in 0...100 {
            print(i)
        }
        nwMonitorSDFSD.cancel()
    }
}
