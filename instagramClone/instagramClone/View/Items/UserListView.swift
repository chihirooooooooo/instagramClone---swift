//
//  UserListView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel : SearchViewModel
    @Binding var searchText : String
    var users : [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(users){ user in
                    NavigationLink {
                        LazyView(ProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                }
            }
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
