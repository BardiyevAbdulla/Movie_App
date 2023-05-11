//
//  Coordinator.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeCoordinators()
}

class BaseCoordinator: Coordinator {
    var navigationController = UINavigationController()
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("this function shouldn't be implements")
    }
    
    func start(coordinator: Coordinator) {
        coordinator.parentCoordinator = self
        childCoordinators += [coordinator]
        coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {$0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
    
    func removeCoordinators() {
        childCoordinators.forEach({$0.removeCoordinators()})
        childCoordinators.removeAll()
    }
    
    deinit {
        print("deinit -> \(String(describing: type(of: self)))")
    }
    
}
