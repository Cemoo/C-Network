//
//  File.swift
//  
//
//  Created by Cemal BAYRI on 11.03.2023.
//

import Alamofire

public enum CNetworkMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
    
    var httpMethod: HTTPMethod {
        return HTTPMethod(rawValue: self.rawValue)
    }
}
