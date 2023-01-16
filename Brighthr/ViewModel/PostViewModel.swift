//
//  PostViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostViewModel : ObservableObject {
    
    @Published var posts: [Post] = []
    var service: PostViewService
    
    init (service: PostViewService) {
        self.service = service
    }
    
    func fetchPosts(complitionHandler: @escaping (APIError?) -> () ){
        service.getPosts { [weak self] (content, error) in
            print(error?.httpError)
            RunLoop.main.perform {
                self?.posts = content ?? []
            }
            complitionHandler(error)
        }
    }
}
