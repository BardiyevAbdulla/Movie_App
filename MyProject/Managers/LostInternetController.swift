//
//  LostInternetController.swift
//  MyProject
//
//  Created by admin on 12/14/22.
//

import UIKit
import Lottie
class LostInternteController: UIViewController {
    var animationLost: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLost = AnimationView(name: "no-internet")
        animationLost.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height-100)
        animationLost.loopMode = .loop
        
        self.view.addSubview(animationLost)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        animationLost.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        animationLost.stop()
    }
}
