//
//  GitHubRepository.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

protocol GitHubRepository {
    func searchRepositories(query: String, completion: @escaping (Result<[Repository], Error>) -> Void)
    func getUserDetails(username: String, completion: @escaping (Result<User, Error>) -> Void)
}
