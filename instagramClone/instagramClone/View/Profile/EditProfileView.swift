//
//  EditProfileView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/25.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText : String
    @ObservedObject var viewModel : EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @Binding var user : User
    
    init(user: Binding<User>){
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
            VStack{
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.saveUserData(bioText)
                    } label: {
                        Text("Done").bold()
                    }

                }.padding()
                
                
                TextArea(text: $bioText, placeholder: "Add your bio..")
                    .frame(width: 370, height: 200)
                    .padding()
                
                Spacer()
                
                
            }
            .onReceive(viewModel.$uploadComplete) { completed in
                if completed {
                    self.mode.wrappedValue.dismiss()
                    self.user.bio = viewModel.user.bio
                }
            }
            
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
