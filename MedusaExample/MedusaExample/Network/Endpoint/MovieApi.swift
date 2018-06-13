//
//  MovieApi.swift
//  MedusaExample
//
//  Created by David Alarcon on 11/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

import Medusa


public enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum MovieApi {
    case recommended(id: Int)
    case popular (page: Int)
    case newMovies(page: Int)
    case video(id:Int)
}

extension MovieApi: EndPointType {
    var environtmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://api.themoviedb.org/3/movie/"
        case .qa: return "https://qa.themoviedb.org/3/movie/"
        case .staging: return "https://staging.themoviedb.org/3/movie/"
        }
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environtmentBaseURL) else { fatalError("baseURL ciuld not no set") }
        return url
    }
    
    public var path: String {
        switch self {
        case .recommended(let id):  return "\(id)/recommendations"
        case .popular:              return "popular"
        case .newMovies:            return "now_playing"
        case .video(let id):        return "\(id)/videos"
        }
    }
        
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var task: HTTPTask {
        switch self {
        case .newMovies(let page): return .requestParameters(bodyParameters: .none, urlParameters: ["page": page, "api_key": NetworkManager.MovieAPIKey], encoder: .url)
        default: return .request
        }
    }
    
    public var headers: HTTPHeaders? { return .none }
}


