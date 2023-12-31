//
//  ContentView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user, selectedIndex : $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
