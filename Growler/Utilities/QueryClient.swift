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
    static func sharedClient(withHeaders headers: [AnyHashable:Any]? = ["authorization": "Bearer iPNw1C7ZafGmeCQC3dAkUwoY"]) -> ApolloClient {
        let url = URL(string: Constants.kQueryURL)
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url!, configuration: configuration))
    }
}
