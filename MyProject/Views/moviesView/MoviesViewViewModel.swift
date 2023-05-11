//
//  MoviesViewViewModel.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import Foundation
import RxSwift

class MoviesViewViewModel {
    
    var currentPage: TypeMode?
    
    var isReload = PublishSubject<Bool>()
   
    var data: MoviesResponse?
    
    var page = 1
    
    let maxPage = 20
    
    let showActorDetailSubject = PublishSubject<Cast>()
    
    var goActorDetailViewObservable: Observable<Cast> {
        return showActorDetailSubject.asObserver()
    }
    
    func goActorDetailView(index: Int) {
        showActorDetailSubject.onNext((data?.results[index])!)
        
    }
    
    func getPopularMovies() {
        
        ApiClient.getPopularMovies(page: page) { moviesResponse in
            if self.data != nil {
                self.data!.results.append(contentsOf: moviesResponse!.results)
            } else {
                self.data = moviesResponse
            }
            
            self.page += 1
            self.isReload.onNext(true)
        }
    }
    
    func getTopRatedMovies() {
     
        ApiClient.getTopratedMovies(page: page) { moviesResponse in
            
            if self.data != nil {
                self.data!.results.append(contentsOf: moviesResponse!.results)
            } else {
                self.data = moviesResponse
            }
            self.page += 1
            self.isReload.onNext(true)
        }
    }
    
    func getUpcomingMovies() {
         
        ApiClient.getUpcomingMovies(page: page) { moviesResponse in
            
            if self.data != nil {
                self.data!.results.append(contentsOf: moviesResponse!.results)
            } else {
                self.data = moviesResponse
            }
            self.page += 1
            self.isReload.onNext(true)
        }
    }
    
    func fetchData() {
        switch currentPage {
        case .popular:
            getPopularMovies()
        case .topRated:
            getTopRatedMovies()
        case .upcoming:
            getUpcomingMovies()
        case .none:
            break
        }
    }
}
