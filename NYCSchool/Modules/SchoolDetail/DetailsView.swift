//
//  DetailsViw.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/16/23.
//

import Foundation
import SwiftUI

// Its a detail view for NYC school which will show SAT score data. I'm using minimal UI but it can be extented like showing more info and location on map.
struct DetailsView: View {
    private var school: NYCSchool

    init(school: NYCSchool) {
        self.school = school
    }

    @StateObject private var viewModel = DetailsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if viewModel.isEmpty {
                Text("No SAT Data available. Please visit later")
            } else {
                Text(school.schoolName)
                    .font(.title)
                Text("Number of Test takers: \(viewModel.satScore.first?.numOfSatTestTakers ?? "")")
                Divider()
                Text("Sat Critical reading average score: \(viewModel.satScore.first?.satCriticalReadingAvgScore ?? "")")
                Divider()
                Text("Sat math average score: \(viewModel.satScore.first?.satMathAvgScore ?? "")")
                Divider()
                Text("Sat math witing score: \(viewModel.satScore.first?.satWritinAvgScore ?? "")")
                Divider()
                Spacer()
            }
        }
        .navigationTitle("SAT exam Information")
        .padding()
        .onAppear {
            viewModel.fetchSatDetails(dbn: school.dbn)
        }
    }
}
