//
//  QueryClient.swift
//  Growler
//
//  Created by Matt Bush on 1/20/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation
import Apollo

final class QueryClient {
    static let url = URL(string: Constants.kQueryURL)
    static let headers: [AnyHashable:Any] = [:]
    static let configuration = URLSessionConfiguration.default
//    configuration.httpAdditionalHeaders = QueryClient.headers
    static let sharedClient = { return ApolloClient(networkTransport: HTTPNetworkTransport(url: QueryClient.url!, configuration: QueryClient.configuration)) }()
}
