//
//  PostComments.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

struct PostComments: Codable{
    var comments: [PostComment]
}

struct PostComment: Codable{
    var postId:Int
    var id:Int
    var name:String
    var email:String
    var body:String
}
