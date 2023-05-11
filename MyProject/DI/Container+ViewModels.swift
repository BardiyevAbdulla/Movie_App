//
//  Container+ViewModels.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModels() {
        autoregister(MoviesViewViewModel.self, initializer: MoviesViewViewModel.init)
        autoregister(MovieDetailViewModel.self, initializer: MovieDetailViewModel.init)
        //autoregister(ActorViewModel.self, initializer: ActorViewModel.init)
    }
}
