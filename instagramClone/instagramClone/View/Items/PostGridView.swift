//
//  PostGridView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    let config : PostGridConfiguration
    @ObservedObject var viewModel : PostGridViewModel
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    init(config : PostGridConfiguration){
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts){ post in
                NavigationLink {
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
        }
    }
}

//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
