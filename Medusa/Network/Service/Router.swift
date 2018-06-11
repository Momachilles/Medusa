//
//  Router.swift
//  Medusa
//
//  Created by David Alarcon on 07/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

import UIKit

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
    }
    func cancel() {
        self.task?.cancel()
    }
    
    //MARK: - Private methods
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest, encoder: HTTPEncoder) throws {
        do {
            switch encoder {
            case .json:
                if let bodyParameters = bodyParameters {
                    try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
                }
            case .url:
                if let urlParameters = urlParameters {
                    try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
                }
            }
        } catch  {
            throw error
        }
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let urlParameters, let encoder):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request, encoder: encoder)
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionalHeaders, let encoder):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request, encoder: encoder)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
