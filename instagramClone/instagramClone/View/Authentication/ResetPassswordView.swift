//
//  ResetPassswordView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/21.
//

import SwiftUI

struct ResetPassswordView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email : String
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("instagramLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }

                }
                
                Button {
                    viewModel.resetPassword(withEmail: email)
                } label: {
                    Text("Send Reset Password Link")
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
        .onReceive(viewModel.$didSendResentPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}

//struct ResetPassswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPassswordView()
//    }
//}
