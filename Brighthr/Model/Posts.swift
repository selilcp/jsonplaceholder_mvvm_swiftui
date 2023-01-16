//
//  Post.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

struct Post: Codable,Identifiable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
}
