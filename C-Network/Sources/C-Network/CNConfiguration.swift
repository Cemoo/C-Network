//
//  CNConfiguration.swift
//  C-Network
//
//  Created by Cemal BAYRI on 12.02.2025.
//

public protocol ConfigurationProtocol {
    var baseApiURL: String { get }
}

public struct CNConfiguration: ConfigurationProtocol {
    public var baseApiURL: String
}
