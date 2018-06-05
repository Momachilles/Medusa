//
//  URLParameterEncoder.swift
//  Medusa
//
//  Created by David Alarcon on 05/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
        }
    }
}
