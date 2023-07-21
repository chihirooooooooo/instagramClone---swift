//
//  ProfileHeaderView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("bart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.leading)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 16) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 1, title: "Following")
                }.padding(.trailing, 32)
            }
            
            Text("Bart Simpson")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Student at Springfield Elementary School")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }.padding(.top)

            
            
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
