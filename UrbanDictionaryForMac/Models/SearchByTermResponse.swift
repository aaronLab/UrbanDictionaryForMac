//
//  SearchByTermResponse.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import Foundation

struct SearchByTermResponse: Decodable, Identifiable {
    
    let id: String
    let term: String?
    let url: String?
    let definition: String?
    let example: String?
    let author: String?
    let author_url: String?
    let posted: String?
    
}

extension SearchByTermResponse {
    
    var formattedPostedDate: Date? {
        guard let posted = self.posted else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: posted)
        return date
    }
    
}
