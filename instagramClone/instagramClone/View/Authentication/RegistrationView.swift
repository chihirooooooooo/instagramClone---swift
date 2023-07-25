//
//  RegistrationView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/21.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    
    @State private var selectedImage : PhotosPickerItem?
    @State private var profileImage : Image?
    @State private var uiProfileImage : UIImage?
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
        
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                ZStack{
                    if let image = profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            
                        
                            
                    } else {
                        PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderless)
                        .padding()
                    }
                }
                

                
                VStack(spacing: 20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                
                
                Button {
                    viewModel.register(withEmail: email, password: password, image: uiProfileImage, fullname: fullname, username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.purple)
                        .clipShape(Capsule())
                        .padding()
                    
                }

                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size : 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }



            }
        }
        .onChange(of: selectedImage) { _ in
            Task {
                if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        profileImage = Image(uiImage: uiImage)
                        guard let profileImage = profileImage else {return}
                        uiProfileImage = profileImage.asUIImage()
                        return
                    }
                }
                print("Failed")
            }
        }

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


