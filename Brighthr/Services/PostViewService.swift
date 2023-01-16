//
//  PostViewService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

protocol PostViewService {
    func getPosts(completionHandler: @escaping (Posts?, APIError?) -> ())
}

class DefaultPostViewService: PostViewService{
    func getPosts(completionHandler: @escaping (Posts?, APIError?) -> ()) {
        let handler = GetPostsHandler()
        let apiLoader = APILoader(apiHandler: handler)
        
        apiLoader.loadAPIRequest { content, error in
            completionHandler(content,error)
        }
    }
}