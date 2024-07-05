//
//  UserViewModelTests.swift
//  Grey GitSearchTests
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import XCTest
import Combine
@testable import Grey_GitSearch

class UserViewModelTests: XCTestCase {
    var viewModel: UserViewModel!
    var cancellables: Set<AnyCancellable>!
    var mockRepository: MockGitHubRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockGitHubRepository()
        let useCase = GetUserDetailsUseCaseImpl(repository: mockRepository)
        viewModel = UserViewModel(getUserDetailsUseCase: useCase)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        mockRepository = nil
        super.tearDown()
    }

    func testFetchUserDetails() {
        // Given
        let user = User(login: "user1", avatar_url: "https://avatars.githubusercontent.com/u/1", followers: 10, following: 5, public_repos: 2, repos_url: "https://api.github.com/users/user1/repos")
        mockRepository.user = user

        // When
        viewModel.username = "user1"
        viewModel.fetchUserDetails()

        // Then
        let expectationUser = self.expectation(description: "Fetching User Details")
        viewModel.$user
            .sink { user in
                XCTAssertEqual(user?.login, "user1")
                XCTAssertEqual(user?.followers, 10)
                expectationUser.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}
