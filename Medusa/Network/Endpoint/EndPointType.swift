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

public enum HTTPEncoder {
    case json
    case url
}

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?, encoder: HTTPEncoder)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?, encoder: HTTPEncoder)
}

public typealias HTTPHeaders = [String:String]

public protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task : HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
