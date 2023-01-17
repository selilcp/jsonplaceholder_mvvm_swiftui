//
//  PostDetails.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostDetails: View {
    
    var postId:Int
    @StateObject var viewModel: PostDetailsViewModel = PostDetailsViewModel( service: DefaultPostDetailsService() )
    
    @State private var apiError:APIError? = nil
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
            Text(viewModel.post?.title ?? "")
                .bold()
                .font(.title3)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 40))
            Text(viewModel.post?.body ?? "")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 40))
            Spacer()
            
            HStack(spacing: 40) {
                Spacer()
                Button("Saved") {
                    viewModel.savePost()
                }
                .foregroundColor(.black)
                .frame(width: 120, height: 40)
                .background(viewModel.postSaved ? .gray : .orange)
                .cornerRadius(8)
                .disabled(viewModel.postSaved)
            
                NavigationLink("Comments", destination: CommentListing(postId: postId))
                .foregroundColor(.black)
                .frame(width: 120, height: 40)
                .background(.green)
                .cornerRadius(8)
                Spacer()
            }
            Spacer()
        }
        .onAppear(){
            viewModel.checkSavedStatus(postID: postId)
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
