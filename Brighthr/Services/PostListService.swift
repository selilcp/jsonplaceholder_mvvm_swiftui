//
//  PostListService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

protocol PostListService {
    func getPosts(completionHandler: @escaping ([Post]?, APIError?) -> ())
}

class DefaultPostListService: PostListService{
    func getPosts(completionHandler: @escaping ([Post]?, APIError?) -> ()) {
        let handler = GetPostsHandler()
        let apiLoader = APILoader(apiHandler: handler)
        
        apiLoader.loadAPIRequest(urlParam: nil,
                                 queryParam: nil,
                                 bodyParam: nil)
        { content, error in
            completionHandler(content ,error)
        }
    }
}
