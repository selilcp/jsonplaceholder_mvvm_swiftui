//
//  PostDetailsService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

protocol PostDetailsService {
    func getPostDetails(postID:Int, completionHandler: @escaping (Post?, APIError?) -> ())
}

class DefaultPostDetailsService: PostDetailsService{
    func getPostDetails(postID:Int, completionHandler: @escaping (Post?, APIError?) -> ()) {
        let handler = GetPostDetailsHandler()
        let apiLoader = APILoader( apiHandler: handler)
        
        apiLoader.loadAPIRequest(urlParam: ["postID":"\(postID)"],
                                 queryParam: nil,
                                 bodyParam: nil)
        { content, error in
            completionHandler(content ,error)
        }
    }
}
