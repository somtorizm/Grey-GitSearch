//
//  MockGitHubRepository.swift
//  Grey GitSearchTests
//
//  Created by Victor Somto on 05/07/2024.
//

import XCTest
import Foundation
@testable import Grey_GitSearch

class MockGitHubRepository: GitHubRepository {
    var repositories: [Repository] = []
    var user: User?

    func searchRepositories(query: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        completion(.success(repositories))
    }

    func getUserDetails(username: String, completion: @escaping (Result<User, Error>) -> Void) {
        if let user = user {
            completion(.success(user))
        } else {
            completion(.failure(URLError(.badServerResponse)))
        }
    }
}
