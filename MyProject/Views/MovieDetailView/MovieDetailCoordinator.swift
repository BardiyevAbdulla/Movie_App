//
//  MovieDetailCoordinator.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import Foundation
import RxSwift

class MovieDetailCoordinator: BaseCoordinator {
    
    private var viewModel = MovieDetailViewModel()
    private let disposeBag = DisposeBag()
    private var movieDetail: Cast?
    
    override func start() {
        self.subscribeEvents()
        
        let movieViewController = MovieDetailView()
        viewModel.setMovie(movieDetail)
        movieViewController.viewModel = viewModel
        navigationController.navigationBar.tintColor = .white
        navigationController.pushViewController(movieViewController, animated: true)
    }
    
    func subscribeEvents() {
        viewModel.goActorDetailViewObservable.subscribe {[weak self] cast in
            guard let self = self else { return }
            
             let actorDetailCoordinator = ActorViewCoordinator()
            actorDetailCoordinator.navigationController = self.navigationController
            actorDetailCoordinator.setActorDetail(cast)
            self.start(coordinator: actorDetailCoordinator)
        }.disposed(by: disposeBag)
    }
    func setMovieDetail(_ movie: Cast) {
        self.movieDetail = movie
        if self.movieDetail == nil {
            print("data won't come sdfsfsfsf")
        }
    }
}
