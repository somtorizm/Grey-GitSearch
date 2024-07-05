//
//  RepositoryViewModelTests.swift
//  Grey GitSearchTests
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import XCTest
import Combine
@testable import Grey_GitSearch

class RepositoryViewModelTests: XCTestCase {
    var viewModel: RepositoryViewModel!
    var cancellables: Set<AnyCancellable>!
    var mockRepository: MockGitHubRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockGitHubRepository()
        let useCase = SearchRepositoriesUseCaseImpl(repository: mockRepository)
        viewModel = RepositoryViewModel(searchRepositoriesUseCase: useCase)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        mockRepository = nil
        super.tearDown()
    }

    func testSearchRepositories() {
        // Given
        let repositories = [
            Repository(id: 1, name: "Repo1", stargazers_count: 100, open_issues_count: 5),
            Repository(id: 2, name: "Repo2", stargazers_count: 200, open_issues_count: 10)
        ]
        mockRepository.repositories = repositories

        // When
        viewModel.searchTerm = "swift"
        viewModel.searchRepositories()

        // Then
        let expectation = self.expectation(description: "Fetching Repositories")
        viewModel.$repositories
            .sink { repositories in
                XCTAssertEqual(repositories.count, 2)
                XCTAssertEqual(repositories[0].name, "Repo1")
                XCTAssertEqual(repositories[1].stargazers_count, 200)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}
