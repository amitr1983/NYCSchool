//
//  NetworkManagerTests.swift
//  NYCSchoolTests
//
//  Created by Amit Rajoriya on 1/20/23.
//

import Combine
import XCTest
import Foundation
@testable import NYCSchool

final class NetworkManagerTests: XCTestCase {
    
    typealias ArrayPublisher = AnyPublisher<[NYCSchool], NetworkRequestError>
    private var cancellables = [AnyCancellable]()
    
    func testNetworkDispatcherSuccess() {
            
            let expectation = XCTestExpectation(description: "Success")
            guard let url = URL(string: "\(Helpers.URLs.baseURL)") else {
                XCTFail()
                return
            }
            guard let testData = Helpers.loadTestData(from: "NYCSchools") else {
                XCTFail()
                return
            }
                    
            MockUrlProtocol.requestHandler = { request in
                let response = HTTPURLResponse.init(url: url,
                                                    statusCode: Helpers.HTTPSettings.httpSuccess,
                                                    httpVersion: Helpers.HTTPSettings.httpVersion,
                                                    headerFields: nil)!
                return (response, testData)
            }
            
            let dispatcher = NetworkDispatcher(urlSession: Helpers.MockURLSession())
            let request = URLRequest(url: url)
            let arrayPublisher: ArrayPublisher = dispatcher.dispatch(request: request)
            arrayPublisher.sink(receiveCompletion: { _ in },
                receiveValue: { value in
                    expectation.fulfill()
                })
            .store(in: &cancellables)
            wait(for: [expectation], timeout: Helpers.HTTPSettings.requestTimeout)
        }

    func testNetworkDispatcherDecodingMalformedError() {
        let expectation = XCTestExpectation(description: "Failure: Json Decoding error")
        guard let url = URL(string: "\(Helpers.URLs.baseURL)") else {
        XCTFail()
            return
        }
            
        guard let testData = Helpers.loadTestData(from: "NYCSchools_malformed") else {
            XCTFail()
            return
        }
            
        MockUrlProtocol.requestHandler = { request in
            let response = HTTPURLResponse.init(url: url,
                                                statusCode: Helpers.HTTPSettings.httpSuccess,
                                                httpVersion: Helpers.HTTPSettings.httpVersion,
                                                headerFields: nil)!
                return (response, testData)
            }
            
            let dispatcher = NetworkDispatcher(urlSession: Helpers.MockURLSession())
            let request = URLRequest(url: url)
            let arrayPublisher: ArrayPublisher = dispatcher.dispatch(request: request)
    
            arrayPublisher.sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, NetworkRequestError.decodingError)
                    expectation.fulfill()
                default:
                    break
                }
            },
            receiveValue: {_ in })
        .store(in: &cancellables)
        wait(for: [expectation], timeout: Helpers.HTTPSettings.requestTimeout)
    }
}
