//
//  SchoolListView.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/16/23.
//

import Foundation
import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.schools) { school in
                NavigationLink {
                    DetailsView(school: school)
                } label: {
                    SchoolView(school: school, isEmpty: viewModel.isEmpty)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("NYC Schools")
        }
        .onAppear {
            viewModel.fetchSchools()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
