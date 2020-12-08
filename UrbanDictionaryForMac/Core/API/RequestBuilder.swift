//
//  RequestBuilder.swift
//  UrbanDictionaryForMac
//
//  Created by Aaron Lee on 2020-12-08.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
