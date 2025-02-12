//
//  File.swift
//  
//
//  Created by Cemal BAYRI on 9.03.2023.
//

import Foundation

public protocol CNetworkProtocol {
    func fetch<T: CNetworkTask>(with task: T, completionHandler: @escaping (CNetworkResult<T.Response>) -> Void)
}
