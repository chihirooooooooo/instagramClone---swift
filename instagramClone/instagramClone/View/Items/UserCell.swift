//
//  UserCell.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("bart")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("bart")
                    .font(.system(size: 14, weight: .semibold))
                Text("Bart Simpson")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
