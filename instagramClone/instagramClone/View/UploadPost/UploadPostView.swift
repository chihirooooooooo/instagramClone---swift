//
//  UploadPostView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var selectedImage : PhotosPickerItem?
    @State var postImage : Image?
    @State var uiPostImage : UIImage?
    @State var captionText = ""
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex : Int
    var body: some View {
        VStack {
            
            if postImage == nil {
                PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
                .buttonStyle(.borderless)
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    TextArea(text: $captionText, placeholder: "Enter your caption...")
                        .frame(height: 200)
                }.padding()
                
                HStack(spacing : 16){
                    Button {
                        captionText = ""
                        postImage = nil
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        if let image = uiPostImage {
                            viewModel.uploadPost(caption: captionText, image: image){ _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    } label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }.padding()

            }
            Spacer()
        }
        .onChange(of: selectedImage) { _ in
            Task {
                if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        postImage = Image(uiImage: uiImage)
                        guard let postImage = postImage else {return}
                        uiPostImage = postImage.asUIImage()
                        return
                    }
                }
                print("Failed")
            }
        }

    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
