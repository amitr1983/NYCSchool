//
//  Request.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/19/23.
//

import Foundation

// Http verb
public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
}

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var param: [String: Any]? { get }
    var headers: [String: String]? { get }
    associatedtype ReturnType: Codable
}

// Default request parameters
extension Request {
    var method: HTTPMethod { return .get }
    var param: [String: Any]? { return nil }
    var headers: [String: String]? { return nil }
}


extension Request {
    //construct a param request
    private func queryItemsFrom(params: [String: Any]?) -> [URLQueryItem]? {
        guard let params = params else { return nil }
        return params.map {
            URLQueryItem(name: $0.key, value: $0.value as? String)
        }
    }
    
    //construct a url request
    func asURLRequest(baseURL: String, params: [String: Any]? = nil) -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        if (param != nil) {
            urlComponents.queryItems = queryItemsFrom(params: param)
        }
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}
