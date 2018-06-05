//
//  ParameterEncoding.swift
//  Medusa
//
//  Created by David Alarcon on 05/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
