//
//  FeedViewModel.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/24.
//

import Foundation

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
        }
    }
}
