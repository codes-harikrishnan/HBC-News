//
//  TopStoriesViewModel.swift
//  HBC News
//
//  Created by Harikrishnan on 31/10/2021.
//

import Foundation
import Combine
import SwiftUI

class TopStoriesViewModel : ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var topStories = [Article]()
    
    
    init() {
       // getTopStories()
        }

    func getTopStories(completionBlock: (() -> Void)? = nil) {
        var  queryItems = [URLQueryItem(name: "country", value: Configuration.shared.country),
                           URLQueryItem(name: "category", value: Configuration.shared.category),
                           URLQueryItem(name: "language", value: Configuration.shared.language)]
        
        queryItems = NetworkManager.shared.buildURLQueryItems(items: queryItems)
        
        NetworkManager.shared.getData(endpoint: NetworkConfig.Path.topStories.endPoint,queryItems: queryItems, type: Article.self).sink(receiveCompletion: {completion in
            
            switch completion {
            case .failure(let error):
               print("Error:",error.localizedDescription)
            case .finished:
                if let completionBlock = completionBlock {
                    completionBlock()
                }
            }
            
        }) { [weak self] stories in
            self?.topStories = stories
        }
        .store(in: &cancellables)
    }
}
