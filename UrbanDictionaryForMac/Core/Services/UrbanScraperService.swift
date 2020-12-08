//
//  UrbanScraperEndpoint.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import Foundation
import Combine

final class UrbanScraperEndpoint {
    
    static func searchByTerm(term: String) -> URLRequest {
        let queryString = term.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: "https://urbanscraper.herokuapp.com/search/\(queryString)")
        
        else { preconditionFailure("searchByTerm ---> Invalid URL format") }
        
        let request = URLRequest(url: url)
        return request
    }
    
}

protocol UrbanScraperService {
    
    var apiSession: APIService { get }
    
    func searchByTerm(term: String) -> AnyPublisher<[SearchByTermResponse], APIError>
    
}

extension UrbanScraperService {
    
    func searchByTerm(term: String) -> AnyPublisher<[SearchByTermResponse], APIError> {
        return apiSession.request(with: UrbanScraperEndpoint.searchByTerm(term: term))
            .eraseToAnyPublisher()
    }
    
}
