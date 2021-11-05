//
//  NetworkConfig.swift
//  HBC News
//
//  Created by Harikrishnan on 31/10/2021.
//

import Foundation

typealias EndPoint = String

struct NetworkConfig {
    static let baseURL = "https://newsapi.org/v2/"
    static let apiKey = "ac57af28e3b74ef680d4d5e51b112a07"
    
    enum Path : String {
        
        case topStories

        var endPoint : EndPoint {
            switch self {
            case .topStories:
                return "top-headlines"
            }
        }
        
        var method : String {
            switch self {
            case .topStories:
                return "GET"
            }
        }
    }
}

enum NetworkError : LocalizedError {
    case invalidURL
    case invalidResponse
    case unknown
}


