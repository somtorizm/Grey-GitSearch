//
//  Repository.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

struct Repository: Identifiable, Codable {
    let id: Int
    let name: String
    let stargazers_count: Int
    let open_issues_count: Int
}
