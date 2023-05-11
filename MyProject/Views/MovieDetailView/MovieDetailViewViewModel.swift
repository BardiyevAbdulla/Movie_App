//
//  MovieDetailViewViewModel.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import Foundation
import RxSwift

class MovieDetailViewModel {
    var movieDetail: Cast?
    var movieCast: MovieCast? = nil
    var isLoadView = PublishSubject<Bool>()
    
    let showActorDetailSubject = PublishSubject<Cast>()
    var goActorDetailViewObservable: Observable<Cast> {
        return showActorDetailSubject.asObserver()
    }
    
    func setMovie(_ movie: Cast?) {
        self.movieDetail = movie
        guard let id = movieDetail else {
            print("data won't come")
            return }
        
        ApiClient.getMovieCost(id: id.id!) { movieCast in
            self.movieCast = movieCast
            print("data has come")
            self.isLoadView.onNext(true)
        }
    }
    
    func goToActors(_ cast: Cast?) {
        showActorDetailSubject.onNext(cast!)
    }
}
