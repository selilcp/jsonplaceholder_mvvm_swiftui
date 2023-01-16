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
                    
                }
                .foregroundColor(.black)
                .frame(width: 120, height: 40)
                .background(.orange)
                .cornerRadius(8)
                .disabled(true)
            
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
            viewModel.fetchPostDetails(postID: postId) { error in
                
            }
        }
    }
}
