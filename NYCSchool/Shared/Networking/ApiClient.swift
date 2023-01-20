//
//  ApiClient.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/19/23.
//

import Combine

// API client to dispatch request
struct APIClient {
    var baseUrl = "https://data.cityofnewyork.us/resource"

    var networkDispatcher: NetworkDispatcher!
    init(networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
        self.networkDispatcher = networkDispatcher
    }

    // Dispatch a request over network
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseUrl) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}
