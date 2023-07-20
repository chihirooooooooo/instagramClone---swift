//
//  Extensions.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/20.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
