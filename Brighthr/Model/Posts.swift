//
//  Post.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

struct Posts: Codable {
    var posts : [Post]
}

struct Post: Codable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
}
