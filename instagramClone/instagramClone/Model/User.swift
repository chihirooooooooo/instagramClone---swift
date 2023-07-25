//
//  User.swift
//  instagramClone
//
//  Created by Chihiro Asanoma on 2023/07/24.
//

import FirebaseFirestoreSwift

struct User : Identifiable, Decodable {
    let username : String
    let email : String
    let profileImageUrl : String
    let fullname : String
    @DocumentID var id : String?
    var stats : UserStats?
    var isFollowed : Bool? = false
    var isCurrentUser : Bool { return AuthViewModel.shared.userSession?.uid == id}
    var bio : String?
}

struct UserStats : Decodable {
    var following : Int
    var posts : Int
    var followers : Int
}
