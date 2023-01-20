//
//  SchoolView.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/19/23.
//

import SwiftUI

//This is a school info view which woul be passed in the dynamic list
struct SchoolView: View {
    private let school: NYCSchool
    private let isEmpty: Bool

    init(school: NYCSchool, isEmpty: Bool) {
        self.school = school
        self.isEmpty = isEmpty
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if isEmpty {
                Text("No data to show. Please try again later")
            } else {
                Text(school.schoolName)
                HStack(alignment: .firstTextBaseline, spacing:5) {
                    Text("Location: \(school.neighborhood)")
                        .font(.caption)
                    Spacer()
                    Text("\u{260E}: \(school.phoneNumber)")
                        .font(.caption)
                }
            }
        }
        .padding()
    }
}
