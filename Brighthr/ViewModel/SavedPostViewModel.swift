//
//  SavedPostViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class SavedPostViewModel : ObservableObject {
    
    @Published var posts: [Post] = []
    var service: DefaultSavedPostService
    
    init (service: DefaultSavedPostService) {
        self.service = service
    }
    
    func fetchSavedPosts(complitionHandler: @escaping (Error?) -> () ){
        service.getSavedPosts
        { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.posts = content ?? []
            }
            self?.updatePostCount(count: content?.count ?? 0)
            complitionHandler(error)
        }
    }
    
    func updatePostCount(count:Int){
        NotificationCenter.default.post(name: .savedPostCount , object: nil,userInfo: ["savedCount":count])
    }
}
