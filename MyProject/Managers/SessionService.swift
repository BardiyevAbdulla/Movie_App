//
//  SessionService.swift
//  MyProject
//
//  Created by admin on 12/14/22.
//

import UIKit
import Network

class SessionService {
    var navigationController = UINavigationController()
    var internetHas: Bool? = nil
    
    var timer: Timer!
    
    func monitorNetwork() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(monitorInternet(_ :)), userInfo: nil, repeats: true)
    }
    @objc func monitorInternet(_ timer: Timer){
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            let noInternet = path.status != .satisfied && self.internetHas != false
            
            let internetHasCome = path.status == .satisfied && self.internetHas == false
            
                if internetHasCome {
                    self.pushViewInterst()
                } else
                if noInternet {
                    self.lostInternet()
                }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        
    }
    
    func pushViewInterst() {
        if internetHas != nil {
            DispatchQueue.main.async {
                self.navigationController.popViewController(animated: true)
                
            }
            self.internetHas = true
        }
    }
    func lostInternet() {

        DispatchQueue.main.async {
            self.internetHas = false
            self.navigationController.pushViewController(LostInternteController(), animated: true)}
        }
}
