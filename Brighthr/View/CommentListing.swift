//
//  CommentListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct CommentListing: View {
    
    var postId:Int
    @StateObject var viewModel: PostCommentsViewModel = PostCommentsViewModel( service: DefaultCommentListService() )
    
    @State private var apiError:APIError? = nil
    
    var body: some View {
        List{
            ForEach(viewModel.comments) { comment in
                PostCommentCell(commentTitle: comment.name, commentBody: comment.body)
            }
        }
        .onAppear(){
            viewModel.fetchPostDetails(postID: postId) { error in
                apiError = error
            }
        }
        .alert(item: $apiError) { error in
            Alert(title: Text("Error"),
                  message: Text(error.alertMessage),
                  dismissButton: .default(Text("Ok") ))
        }
    }
}
