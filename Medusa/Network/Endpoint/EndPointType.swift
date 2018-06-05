//
//  EndPointType.swift
//  Medusa
//
//  Created by David Alarcon on 05/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum HTTPTask {
    case request
}

public typealias HTTPHeaders = [String:String]

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task : HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
