//
//  PostListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostListing: View {
    
    @StateObject var viewModel: PostListViewModel = PostListViewModel(service: DefaultPostListService())
    
    @State private var apiError:APIError? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    let user = viewModel.getUsername(userid: post.userId)
                    PostListingCell(postTitle: post.title,
                                    username: user,
                                    postBody: post.body,
                                    postId: post.id)
                }
            }
            .onAppear () {
                fetchUsersList()
                fetchPosts()
            }
            .alert(item: $apiError) { error in
                Alert(title: Text("Error"),
                      message: Text(error.alertMessage),
                      dismissButton: .default(Text("Ok") ))
            }
   
        }
    }
    
    func fetchUsersList(){
        viewModel.fetchUsersList(complitionHandler: { error in
            apiError = error
        })
    }
    
    func fetchPosts(){
        viewModel.fetchPosts(complitionHandler: { error in
            apiError = error
        })
    }
}
