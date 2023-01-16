//
//  APIPath.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

struct APIPath{
    
    private var baseURL:String
    
    init(){
        baseURL = AppEnvironment().getBaseURL()
    }
    
    var getPost:String { "\(baseURL)posts/" }
    
    var getPostDetails:String { "\(baseURL)posts/{postID}/" }
    
    var getPostComments:String { "\(baseURL)posts/{postID}/comments/" }
}
