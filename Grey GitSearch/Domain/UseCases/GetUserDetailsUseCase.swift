//
//  GetUserDetailsUseCase.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

protocol GetUserDetailsUseCase {
    func execute(username: String, completion: @escaping (Result<User, Error>) -> Void)
}
