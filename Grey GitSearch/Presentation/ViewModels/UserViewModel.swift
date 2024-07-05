//
//  UserViewModel.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation

import Combine

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var repositories: [Repository] = []
    @Published var username: String = ""

    private let getUserDetailsUseCase: GetUserDetailsUseCase
    private var cancellables: Set<AnyCancellable> = []

    init(getUserDetailsUseCase: GetUserDetailsUseCase) {
        self.getUserDetailsUseCase = getUserDetailsUseCase
    }

    func fetchUserDetails() {
        guard !username.isEmpty else {
            user = nil
            return
        }

        getUserDetailsUseCase.execute(username: username) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.user = user
                case .failure(let error):
                    print("Error: \(error)")
                    self?.user = nil
                }
            }
        }
    }
}
