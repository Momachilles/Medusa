//
//  NetworkManager.swift
//  MedusaExample
//
//  Created by David Alarcon on 11/06/2018.
//  Copyright © 2018 David Alarcon. All rights reserved.
//

import Medusa

enum Result<String> {
    case success
    case failure(String)
}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad Request"
    case outdated = "The url you requestes is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unabletoDecode = "We could not decode the response."
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    static let MovieAPIKey = "ac6333f0dca05c37f391e8865fc7ce49"
    private let router = Router<MovieApi>()
    
    fileprivate func handleNetworkReponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...499: return .failure(NetworkResponse.authenticationError.rawValue)
        case 500...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600:       return .failure(NetworkResponse.outdated.rawValue)
        default:        return .failure (NetworkResponse.failed.rawValue)
        }
    }
    
    func movies(page: Int, completion: @escaping (_ movie: [Movie]?, _ error: String?) -> ()) {
        router.request(.newMovies(page: page)) {[self ] data, response, error in
            if let _ = error {
                completion(nil, "Please check your network connection.")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkReponse(response)
                switch result{
                case .success:
                    guard let data = data else {
                        completion(.none, NetworkResponse.noData.rawValue)
                        return
                    }
                    
                    do {
                        print(data)
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        print(json)
                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: data)
                        completion(apiResponse.movies, .none)
                    } catch {
                        print(error)
                        completion(.none, NetworkResponse.unabletoDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(.none, networkFailureError)
                }
            }
        }
    }
    
}
