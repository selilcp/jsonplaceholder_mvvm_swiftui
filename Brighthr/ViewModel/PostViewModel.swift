//
//  PostViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostViewModel {
    
    var posts: Posts?
    var service: PostViewService
    
    init (service: PostViewService) {
        self.service = service
    }
    
    func fetchPosts(complitionHandler: @escaping (APIError?) -> () ){
        service.getPosts { [weak self] (content, error) in
            self?.posts = content
            complitionHandler(error)
        }
    }
}
