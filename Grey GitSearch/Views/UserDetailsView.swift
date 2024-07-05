//
//  UserDetailsView.swift
//  Grey GitSearch
//
//  Created by Victor Somto on 05/07/2024.
//

import Foundation
import SwiftUI

struct UserDetailsView: View {
    let user: User
    @ObservedObject private var viewModel: UserViewModel = UserViewModel(getUserDetailsUseCase: GetUserDetailsUseCaseLocal())

    var body: some View {
        VStack {
            if let imageUrl = URL(string: user.avatar_url), let imageData = try? Data(contentsOf: imageUrl), let avatarImage = UIImage(data: imageData) {
                Image(uiImage: avatarImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
            }

            Text(user.login)
                .font(.title)

            Text("Followers: \(user.followers), Following: \(user.following)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()

            if !viewModel.repositories.isEmpty {
                List(viewModel.repositories) { repository in
                    Text(repository.name)
                }
                .listStyle(GroupedListStyle())
            } else {
                Text("No repositories found.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationBarTitle("User Details")
        .onAppear {

        }
    }
}
