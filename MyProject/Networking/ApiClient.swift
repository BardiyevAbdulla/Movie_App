//
//  ApiRouter.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import Foundation
import Alamofire

class ApiClient {
    
    static func performRequestScale<T: Codable> (route: ApiRouter,decoder: JSONDecoder = JSONDecoder(),completion: @escaping (T?)->Void)-> DataRequest {
        
        return AF.request(route).responseDecodable(decoder: decoder) { (response: AFDataResponse<T>) in
            let result = response.result
            
            switch result {
            case .success(let resData):
                completion(resData)
            case .failure(let error):
                completion(nil)
            }
        }
    }
    
    static func getPopularMovies(page: Int, completion: @escaping(MoviesResponse?)->Void) {
        ApiClient.performRequestScale(route: .popularMovies(page), completion: completion)
    }
    
    static func getTopratedMovies(page: Int, completion: @escaping(MoviesResponse?)->Void) {
        ApiClient.performRequestScale(route: .getTopratedMovies(page), completion: completion)
    }
    
    static func getUpcomingMovies(page: Int, completion: @escaping(MoviesResponse?)->Void) {
        ApiClient.performRequestScale(route: .getUpcomingMovies(page), completion: completion)
    }
    
    static func getMovieCost(id: Int, completion: @escaping(MovieCast?)->Void) {
        ApiClient.performRequestScale(route: .getMovieCast(id), completion: completion)
    }
    
    static func getActorMovies(id: Int, completion: @escaping(MovieCast?)->Void) {
        ApiClient.performRequestScale(route: .getActorMovies(id), completion: completion)
    }
    
  
}
