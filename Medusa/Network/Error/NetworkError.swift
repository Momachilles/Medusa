//
//  NetworkError.swift
//  Medusa
//
//  Created by David Alarcon on 05/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding failed."
    case missingURL = "URL is nil."
}
