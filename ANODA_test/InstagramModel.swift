//
//  InstagramModel.swift
//  ANODA_test
//
//  Created by md760 on 06.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

struct FlowPosts: Decodable {
    let data: [PostModel]
}

struct PostModel: Decodable {
    let usersProfileImage: String
    let userName: String
    let locationName: String
    let photoImages: [String]
    let liked: Int
    let peopleWhoLiked: [String]
    let likeCount: Int
    let userComment: String
    let time: String
}



