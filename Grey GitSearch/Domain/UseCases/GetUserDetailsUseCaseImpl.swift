//
//  GetUserDetailsUseCaseImpl.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

class GetUserDetailsUseCaseImpl: GetUserDetailsUseCase {
    private let repository: GitHubRepository

    init(repository: GitHubRepository) {
        self.repository = repository
    }

    func execute(username: String, completion: @escaping (Result<User, Error>) -> Void) {
        repository.getUserDetails(username: username, completion: completion)
    }
}
