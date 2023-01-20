//
//  Helper.swift
//  NYCSchoolTests
//
//  Created by Amit Rajoriya on 1/20/23.
//

import Foundation
import XCTest

struct Helpers {
    enum URLs {
        static let baseURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    }
    
    enum HTTPSettings {
        static let httpVersion = "2.0"
        static let httpSuccess = 200
        static let httpnotFound = 404
        static let httpError = 409
        static let requestTimeout = 5.0
    }
    
    static func loadTestData(from data: String) -> Data? {
        guard let url = Bundle(for: NetworkManagerTests.self).url(forResource: data, withExtension: "json") else {
            return nil
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            fatalError("couldn't load json")
        }
    }
    
    static func MockURLSession() -> URLSession {
        let urlSessionConfig = URLSessionConfiguration.ephemeral
        urlSessionConfig.protocolClasses = [MockUrlProtocol.self]
        return URLSession(configuration: urlSessionConfig)
    }
}
