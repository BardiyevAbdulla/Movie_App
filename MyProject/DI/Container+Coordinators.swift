//
//  Container+Coordinators.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import Foundation
import Swinject

extension Container {
    
    func registerCoordinators() {
    
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(MoviesViewCoordinator.self, initializer: MoviesViewCoordinator.init)
        autoregister(MovieDetailCoordinator.self, initializer: MovieDetailCoordinator.init)
//        autoregister(ActorViewCoordinator.self, initializer: ActorViewCoordinator.init)
//        autoregister(MainTabBarViewCoordinator.self, initializer: MainTabBarViewCoordinator.init)
    }
}
