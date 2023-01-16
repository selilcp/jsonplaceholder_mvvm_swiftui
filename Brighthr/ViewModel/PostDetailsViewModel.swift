//
//  PostDetailsViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostDetailsViewModel : ObservableObject {
    
    @Published var post: Post?
    @Published var postSaved: Bool = false
    var service: PostDetailsService
    
    init (service: PostDetailsService) {
        self.service = service
    }
    
    func fetchPostDetails(postID:Int,complitionHandler: @escaping (APIError?) -> () ){
        service.getPostDetails(postID: postID)
        { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.post = content
            }
            complitionHandler(error)
        }
    }
    
    func checkSavedStatus(postID: Int){
        postSaved = service.checkPostSaved(id: postID)
    }
    
    func savePost(){
        guard let post = post else {return}
        service.savePost(post: post)
    }
}
