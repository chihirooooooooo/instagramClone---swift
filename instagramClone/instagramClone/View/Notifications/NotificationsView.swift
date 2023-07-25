//
//  NotificationsView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 20){
                ForEach(viewModel.notifications){ notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
