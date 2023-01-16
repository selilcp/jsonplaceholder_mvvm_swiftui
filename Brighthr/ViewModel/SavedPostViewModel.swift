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
            complitionHandler(error)
        }
    }
}
