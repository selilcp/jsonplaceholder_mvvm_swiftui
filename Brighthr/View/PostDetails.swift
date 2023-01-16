//
//  PostDetails.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostDetails: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
            Text("Title")
                .bold()
                .font(.title3)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 40))
            Text("sub..")
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
            
                NavigationLink("Comments", destination: CommentListing())
                .foregroundColor(.black)
                .frame(width: 120, height: 40)
                .background(.green)
                .cornerRadius(8)
                Spacer()
            }
            Spacer()
        }
    }
}
