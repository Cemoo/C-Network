//
//  File.swift
//  
//
//  Created by Cemal BAYRI on 11.03.2023.
//

import Foundation
import Alamofire

public protocol CNetworkTask {
    associatedtype Request: Codable
    associatedtype Response: Codable
    
    var method: HTTPMethod { get set }
    var headers: [String: String]? { get set }
    var url: String { get set }
    var request: Request { get set }
    var encoding: ParameterEncoding { get }
}

public extension CNetworkTask {
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func encodeParameters() throws -> [String: Any]? {
        let encoder = JSONEncoder()
        let parameters = try encoder.encode(request)
        return try JSONSerialization.jsonObject(with: parameters, options: .allowFragments) as? [String: Any]
    }
}
