//
//  ApiClient.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case popularMovies(Int)
    case getUpcomingMovies(Int)
    case getTopratedMovies(Int)
    case getMovieCast(Int)
    case getActorMovies(Int)
    
    var path: String {
        switch self {
        case .popularMovies :
            return "\(Constants.BASE_URL)movie/popular"
        case .getUpcomingMovies:
            return "\(Constants.BASE_URL)movie/upcoming"
        case .getTopratedMovies:
            return "\(Constants.BASE_URL)movie/top_rated"
        case .getMovieCast(let id):
            return "\(Constants.BASE_URL)movie/\(id)/credits"
        case .getActorMovies(let id):
            return "\(Constants.BASE_URL)person/\(id)/movie_credits"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queties: Parameters {
        switch self {
        case .popularMovies(let page):
            return ["api_key" : "503c07b94a23031d52f4eb6b7c8ce4ce",
                "page" : "\(page)"]
        case .getUpcomingMovies(let page):
            return ["api_key" : "503c07b94a23031d52f4eb6b7c8ce4ce",
                "page" : "\(page)"]
        case .getTopratedMovies(let page):
            return ["api_key" : "503c07b94a23031d52f4eb6b7c8ce4ce",
                "page" : "\(page)"]
        default:
            return ["api_key" : "503c07b94a23031d52f4eb6b7c8ce4ce"]
            
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: URL(string: path)!)
        
        urlRequest.method = method
        
        if queties != nil {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queties)
        }
        return urlRequest
    }
    
    
}
