//
//  Container+RegisterDependencies.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import Swinject

extension Container {
    
    func registerDependencies() {
        //self.registerServices()
        self.registerCoordinators()
        self.registerViewModels()
    }
}
