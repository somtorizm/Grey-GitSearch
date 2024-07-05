//
//  UserSearchView.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import SwiftUI

struct UserSearchView: View {
    @State private var username: String = ""
    @ObservedObject private var viewModel: UserViewModel = UserViewModel(getUserDetailsUseCase: GetUserDetailsUseCaseLocal())

    var body: some View {
        VStack {
            TextField("Enter GitHub Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                viewModel.username = username
                viewModel.fetchUserDetails()
            }) {
                Text("Find User")
            }
            .padding()

            if let user = viewModel.user {
                NavigationLink(destination: UserDetailsView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.login)
                            .font(.headline)
                        Text("Followers: \(user.followers), Following: \(user.following)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Find User")
    }
}
