//
//  NYCSchoolSatScore.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/20/23.
//

import Foundation

//Model for NYC School - SAT data
struct SatScore: Codable {
    var dbn: String
    var numOfSatTestTakers: String
    var satCriticalReadingAvgScore: String
    var satMathAvgScore: String
    var satWritinAvgScore: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritinAvgScore = "sat_writing_avg_score"
    }
}

struct FetchSchoolSatDetails: Request {
    typealias ReturnType = [SatScore]
    var path: String
    var method: HTTPMethod = .get
    var param: [String : Any]?
    init(param: [String : Any]) {
        path = "/f9bf-2cp4.json"
        self.param = param
    }
}
