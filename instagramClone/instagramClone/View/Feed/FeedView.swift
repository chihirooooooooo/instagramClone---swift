//
//  FeedView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32){
                ForEach(0 ..< 10){ _ in
                    FeedCell()
                }
            }.padding(.top)
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
