//
//  NetworkRouter.swift
//  Medusa
//
//  Created by David Alarcon on 06/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
