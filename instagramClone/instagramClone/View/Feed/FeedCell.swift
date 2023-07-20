//
//  FeedCell.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("bart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("bart")
                    .font(.system(size: 14, weight: .semibold))
                    
            }.padding([.leading, .bottom], 8)
            
            Image("bart")
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.width)
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }

            }.foregroundColor(.black)
                .padding(.leading, 4)
            
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{
                Text("bart").font(.system(size: 14, weight: .semibold)) +
                Text(" I’ve done a lot of bad stuff through the years. Now I’m paying the price but there’s so many things I’ll never get a chance to do: smoke a cigarette, use a fake I.D., shave a swear word in my hair…")
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 2)
            
            
            
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
