//
//  RepositoryViewModel.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import Combine

class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var searchTerm: String = ""

    private let searchRepositoriesUseCase: SearchRepositoriesUseCase
    private var cancellables: Set<AnyCancellable> = []

    init(searchRepositoriesUseCase: SearchRepositoriesUseCase) {
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }

    func searchRepositories() {
        guard !searchTerm.isEmpty else {
            repositories = []
            return
        }

        searchRepositoriesUseCase.execute(query: searchTerm) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repositories):
                    self?.repositories = repositories
                case .failure(let error):
                    print("Error: \(error)")
                    self?.repositories = []
                }
            }
        }
    }
}
