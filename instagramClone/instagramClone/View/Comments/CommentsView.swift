//
//  CommentsView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/25.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText = ""
    @ObservedObject var viewModel : CommentViewModel
    init(post : Post){
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.comments){ comment in
                        CommentCell(comment : comment)
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action : uploadComment)
        }
    }
    
    func uploadComment(){
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView()
//    }
//}
