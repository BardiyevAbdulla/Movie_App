//
//  BaseCoordinator.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit

class AppCoordinator: BaseCoordinator {
   
    var window: UIWindow?
    
    override func start() {
        removeCoordinators()
        window?.makeKeyAndVisible()
        let coordinator = MainTabBarCoordinator()
        start(coordinator: coordinator)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
    }
    func setWindow(window: UIWindow?) {
        self.window = window
    }
}
