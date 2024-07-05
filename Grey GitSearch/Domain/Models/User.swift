//
//  User.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

struct User: Codable {
    let login: String
    let avatar_url: String
    let followers: Int
    let following: Int
    let public_repos: Int
    let repos_url: String
}
