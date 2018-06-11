//
//  MovieApi.swift
//  MedusaExample
//
//  Created by David Alarcon on 11/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

import Medusa


enum NetworkEnvironment {
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
        case qa:
            <#code#>
        default:
            <#code#>
        }
    }
}


