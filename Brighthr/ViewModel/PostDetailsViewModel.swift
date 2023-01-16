//
//  PostDetailsViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostDetailsViewModel : ObservableObject {
    
    @Published var posts: Post?
    var service: PostDetailsService
    
    init (service: PostDetailsService) {
        self.service = service
    }
    
    func fetchPosts(postID:Int,complitionHandler: @escaping (APIError?) -> () ){
        service.getPostDetails(postID: postID)
        { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.posts = content
            }
            complitionHandler(error)
        }
    }
}
