//
//  SearchViewModel.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject, UrbanScraperService {
    
    var apiSession: APIService
    
    @Published var searchByTermResponse: [SearchByTermResponse]?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(_ apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func searchByTerm(term: String) {
        self.searchByTerm(term: term)
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle error ---> \(error)")
                case .finished:
                    break
                }
            } receiveValue: { response in
                self.searchByTermResponse = response
                print(response)
            }
            .store(in: &self.cancellables)

    }
    
}
