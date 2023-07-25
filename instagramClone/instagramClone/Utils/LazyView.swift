//
//  LazyView.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/25.
//

import SwiftUI

struct LazyView<Content : View> : View {
    let build : () -> Content
    init(_ build : @autoclosure @escaping ()-> Content) {
        self.build = build
    }
    var body : Content {
        build()
    }
}


