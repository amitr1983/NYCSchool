//
//  DetailsViewModel.swift
//  NYCSchool
//
//  Created by Amit Rajoriya on 1/16/23.
//

import Foundation
import Combine

// This is a view model for details view. It doesnt know anything about view and has a binding with view.
class DetailsViewModel: ObservableObject {
    private var cancellables = [AnyCancellable]()
    @Published var isEmpty: Bool = false
    @Published var satScore: [SatScore] = []
    let apiClient = APIClient()

    init() {
        bind()
    }
    
    private func bind() {
        $satScore.map({ $0.count == 0 }).assign(to: &$isEmpty)
    }

    // It will fecth sat details. it will also handle an empty result or error.
    func fetchSatDetails(dbn: String) {
        let apiClient = APIClient()
        apiClient.dispatch(FetchSchoolSatDetails(param: ["dbn" : dbn]))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                    self?.isEmpty = true
                    print(error)
                    }
                }, receiveValue: { [weak self] sat in
                    self?.satScore = sat.filter { $0.dbn == dbn }
                })
            .store(in: &self.cancellables)
    }
}
