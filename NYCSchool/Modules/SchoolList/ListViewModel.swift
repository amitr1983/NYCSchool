//
//  ListViewModel.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/16/23.
//

import Foundation
import Combine

// This is a view model for School List view. It doesnt know anything about view and has a binding with view.
class ListViewModel: ObservableObject {
    @Published var schools: [NYCSchool] = []
    @Published var isEmpty: Bool = false
    let apiClient = APIClient()

    init() {
        bind()
    }
    
    private func bind() {
        $schools.map({ $0.count == 0 }).assign(to: &$isEmpty)
    }

    func fetchSchools() {
        apiClient.dispatch(FetchSchools())
            .receive(on: RunLoop.main)
            .replaceError(with: [])
            .assign(to: &$schools)
    }
}
