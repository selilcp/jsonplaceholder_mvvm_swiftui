//
//  SavedPostListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct SavedPostListing: View {
    @StateObject var viewModel: SavedPostViewModel = SavedPostViewModel(service: DefaultSavedPostService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    PostListingCell(postTitle: post.title,
                                    postBody: post.body,
                                    postId: post.id)
                }
            }
            .onAppear () {
                fetchPosts()
            }
        }
    }
    
    func fetchPosts(){
        viewModel.fetchSavedPosts { error in
            
        }
    }
}
