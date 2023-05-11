//
//  MoviesViewCoordinator.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import Foundation
import RxSwift

class MoviesViewCoordinator: BaseCoordinator {
    private var viewModel = MoviesViewViewModel()
    
   private var viewController = MoviesView()
    
    private let disposeBag = DisposeBag()
        
    override func start() {
        subscribeEvents()
        
        viewController.viewModel = self.viewModel
        
        navigationController.pushViewController(viewController, animated: false)
    }
    //func subscribeBackBeginingEvent() {
        
    
    func subscribeEvents() {
        viewModel.showActorDetailSubject.subscribe { [weak self] movieDetail in
            guard let self = self else { return }
        
            let movieDetailCoordinator = MovieDetailCoordinator()
            movieDetailCoordinator.navigationController = self.navigationController
            movieDetailCoordinator.setMovieDetail(movieDetail)
            self.start(coordinator: movieDetailCoordinator)
            
        }.disposed(by: disposeBag)
    }
    
    func loadViews(model: TypeMode) {

        viewController.title = model.title
        viewModel.currentPage = model
        viewModel.fetchData()
    }
}
