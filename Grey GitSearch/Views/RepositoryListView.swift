//
//  RepositoryListView.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import SwiftUI

struct RepositoryListView: View {
    
    @StateObject private var viewModel = RepositoryViewModel(searchRepositoriesUseCase: SearchRepositoriesUseCaseLocal())

    var body: some View {
        VStack {
            TextField("Search repositories", text: $viewModel.searchTerm, onCommit: {
                viewModel.searchRepositories()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            List(viewModel.repositories) { repository in
                VStack(alignment: .leading) {
                    Text(repository.name)
                    Text("Stars: \(repository.stargazers_count), Issues: \(repository.open_issues_count)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle("Repositories")
    }
}
