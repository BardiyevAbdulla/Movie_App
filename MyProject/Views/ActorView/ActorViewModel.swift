//
//  ActorViewModel.swift
//  MyProject
//
//  Created by admin on 12/15/22.
//

import Foundation
import RxSwift

class ActorViewModel {
    let disposeBag = DisposeBag()
    var isDataLoaded = PublishSubject<Bool>()
    let showMovieDetailSubject = PublishSubject<Cast>()
    
    var goMovieDetailViewObservable: Observable<Cast> {
        return showMovieDetailSubject.asObserver()
    }
    var actorMovies: MovieCast? = nil
    var actor: Cast? = nil
    
    func getActorMovies(id: Int) {
        ApiClient.getActorMovies(id: id) { movieCast in
            self.actorMovies = movieCast
            self.isDataLoaded.onNext(true)
        }
    }
    
    func setActor(_ cast: Cast?) {
        self.actor = cast
        
        if let castID = cast?.id {
            getActorMovies(id: castID)
        }
    }
    func goMovieDetailView(movie: Cast) {
        showMovieDetailSubject.onNext(movie)
    }
}
