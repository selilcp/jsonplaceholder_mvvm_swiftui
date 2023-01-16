//
//  MainTabView.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView{
            PostListing()
                .tabItem {
                    Label("Editor", systemImage: "pencil.circle")

                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
