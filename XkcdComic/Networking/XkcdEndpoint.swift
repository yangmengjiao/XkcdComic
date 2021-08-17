//
//  XkcdEndpoint.swift
//  XkcdComic
//
//  Created by mengjiao on 8/17/21.
//

import Foundation
import NetworkingEngine

/// Endpoint for Xkcd Website
/// Can add more cases in the future.
///

enum XkcdEndpointConstant {
    static let https = "https"
    static let defaultBaseURL = "xkcd.com"
    static let defaultPath = "/info.0.json"
    static let get = "GET"
}

enum XkcdEndpoint: Endpoint {
    case getComicWith(index: Int)
    case getCurrentComit
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
        case .getCurrentComit:
            return XkcdEndpointConstant.defaultBaseURL
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
