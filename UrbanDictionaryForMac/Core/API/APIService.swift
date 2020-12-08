//
//  APIService.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
