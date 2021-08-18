//
//  NetWorkingEngineMock.swift
//  XkcdComicTests
//
//  Created by mengjiao on 8/17/21.
//

import Foundation
import NetworkingEngine

/// This is a Mock Networking engine for unit testing. 
class MockNetWorkingEngine: NetWorkingEngineProtocol {
    static var successFlag: Bool = true
    static func request<T>(endpoint: EndpointProtocol, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        guard successFlag else {
            completion(.failure(NSError(domain: "Error", code: 400, userInfo: nil)))
            return
        }
        completion(.success(MockResponseData.comicData as! T))
    }
}
