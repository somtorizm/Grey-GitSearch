//
//  HomeView.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RepositoryListView()) {
                    Text("Search Repositories")
                }
                .padding()

                NavigationLink(destination: UserSearchView()) {
                    Text("Find User")
                }
                .padding()
            }
            .navigationBarTitle("Home")
        }
    }
}
