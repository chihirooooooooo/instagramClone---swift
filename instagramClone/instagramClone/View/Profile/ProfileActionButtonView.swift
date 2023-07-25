//
//  ProfileActionButtonView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var viewModel : ProfileViewModel
    var isFollowed: Bool {return viewModel.user.isFollowed ?? false}
    @State var showEditProfile = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }.sheet(isPresented: $showEditProfile) {
                EditProfileView(user: $viewModel.user)
            }
        } else {
            HStack {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollowed ? .black : .white)
                        .frame(width: 172, height: 32)
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }.cornerRadius(3)
                
                Button {
                    
                } label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
