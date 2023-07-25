//
//  CustomInputView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/25.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText : String
    var action : () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                Button {
                    action()
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""))
//    }
//}
