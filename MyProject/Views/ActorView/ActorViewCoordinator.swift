//
//  ActorViewCoordinator.swift
//  MyProject
//
//  Created by admin on 12/14/22.
//

import RxSwift

class ActorViewCoordinator: BaseCoordinator {
    var actorDetail: Cast? = nil
    var viewModel = ActorViewModel()
    private let disposeBag = DisposeBag()
    
    override func start() {
        subscribeEvents()
        viewModel.setActor(actorDetail)
        let actorView = ActorView(viewModel: viewModel)
        navigationController.pushViewController(actorView, animated: true)
    }
    
    func subscribeEvents() {
        viewModel.goMovieDetailViewObservable.subscribe { movieDetail in
            let movieDetailCoordinator = MovieDetailCoordinator()
            movieDetailCoordinator.navigationController = self.navigationController
            movieDetailCoordinator.setMovieDetail(movieDetail)
            self.start(coordinator: movieDetailCoordinator)
            
        }
    }
    func setActorDetail(_ cast: Cast) {
        self.actorDetail = cast
    }
}
