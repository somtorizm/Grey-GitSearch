//
//  SearchRepositoriesUseCase.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

protocol SearchRepositoriesUseCase {
    func execute(query: String, completion: @escaping (Result<[Repository], Error>) -> Void)
}
