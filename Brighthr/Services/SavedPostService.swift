//
//  SavedPostService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

protocol SavedPostService {
    func getSavedPosts(completionHandler: @escaping ([SavedPost]?, Error?) -> ())
}

class DefaultSavedPostService: SavedPostService{
    func getSavedPosts(completionHandler: @escaping ([SavedPost]?, Error?) -> ()) {
        let request = SavedPost.fetchRequest()
        do {
            let entities = try PersistenceController.shared.container.viewContext.fetch(request)
            completionHandler(entities, nil)
        } catch let error {
            completionHandler(nil,error)
        }
    }
}
