//
//  NYCSchool.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/19/23.
//

import Foundation

//Model for NYC School
struct NYCSchool: Codable, Identifiable {
    let id = UUID()
    var dbn: String
    var schoolName: String
    var neighborhood: String
    var phoneNumber: String

    enum CodingKeys: String, CodingKey {
        case dbn, neighborhood
        case schoolName = "school_name"
        case phoneNumber = "phone_number"
    }
}

struct FetchSchools: Request {
    typealias ReturnType = [NYCSchool]
    var path: String
    var method: HTTPMethod = .get
    init() {
        path = "/s3k6-pzi2.json"
    }
}
