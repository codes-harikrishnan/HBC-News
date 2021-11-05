//
//  NetworkManager.swift
//  HBC News
//
//  Created by Harikrishnan on 31/10/2021.
//

import Foundation
import Combine

typealias UrlString = String
class NetworkManager {
    
    static let shared =  NetworkManager()
    private init() {
        
    }
    private var cancellables = Set<AnyCancellable>()
    
    func getData<T :Decodable>(endpoint: EndPoint,id:String? = nil,queryItems:[URLQueryItem]? = nil, type : T.Type)-> Future<[T],Error> {
        return Future<[T],Error>{[weak self] promise in
            
            guard let self = self,let queryItems = queryItems, let urlRequest = self.buildURLRequest(endPoint:  NetworkConfig.Path.topStories.endPoint,queryItems: queryItems)  else {
                return promise(.failure(NetworkError.invalidURL))
            }
            print("URL:",urlRequest.url?.absoluteString)
            
            URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap { (data,response) -> Data in
                    
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else { throw NetworkError.invalidResponse}
                    return data
                }
                .decode(type:News.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: {(completion) in
                    if case let .failure(error) = completion {
                        
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
    
                    
                }, receiveValue: { promise(.success($0.articles as! [T]))})
                .store(in: &self.cancellables)
        }
    }
    
    
    func buildURLQueryItems(items : [URLQueryItem]) -> [URLQueryItem]{
        var queryItems = [URLQueryItem(name: "apiKey", value: NetworkConfig.apiKey)]
        queryItems.append(contentsOf: items)
       return queryItems
    }
    func buildURLRequest(endPoint: EndPoint,queryItems : [URLQueryItem]) -> URLRequest? {
        let api =  NetworkConfig.baseURL + endPoint
        guard var components = URLComponents(string: api) else {return nil}
        
        components.queryItems = queryItems
        
        guard let url = components.url else {return nil}
        
        return URLRequest(url: url)
    }
}
