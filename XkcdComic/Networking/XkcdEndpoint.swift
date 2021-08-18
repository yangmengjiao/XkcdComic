//
//  XkcdEndpoint.swift
//  XkcdComic
//
//  Created by mengjiao on 8/17/21.
//

import Foundation
import NetworkingEngine

/// XkcdEndpoint's  Constants
enum XkcdEndpointConstant {
    static let https = "https"
    static let defaultBaseURL = "xkcd.com"
    static let defaultPath = "/info.0.json"
    static let get = "GET"
}

/// Endpoint for Xkcd Website
/// Can add more cases in the future.
///
enum XkcdEndpoint: EndpointProtocol {
    case getComicWith(index: Int)
    case getCurrentComic
    var scheme: String {
        switch self {
        default:
            return XkcdEndpointConstant.https
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return XkcdEndpointConstant.defaultBaseURL
        }
    }
  
    var path: String {
        switch self {
        case .getComicWith(let index):
            return "/\(index)\(XkcdEndpointConstant.defaultPath)"
        case .getCurrentComic:
            return XkcdEndpointConstant.defaultPath
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
            default:
            return [URLQueryItem]()
           }
    }
    
    var method: String {
        switch self {
        default:
            return XkcdEndpointConstant.get
        }
    }

}
