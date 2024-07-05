//
//  SearchRepositoriesUseCaseImpl.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

class SearchRepositoriesUseCaseImpl: SearchRepositoriesUseCase {
    private let repository: GitHubRepository

    init(repository: GitHubRepository) {
        self.repository = repository
    }

    func execute(query: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        repository.searchRepositories(query: query, completion: completion)
    }
}
