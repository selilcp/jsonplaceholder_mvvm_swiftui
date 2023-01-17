//
//  MainTabView.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var savedCount:Int = 0

    var body: some View {
        TabView{
            SavedPostListing()
            .tabItem {
                Label("Saved Posts \(savedCount)", systemImage: "externaldrive.fill")
            }
            .onReceive(NotificationCenter.default.publisher(for: .savedPostCount)) { output in
                savedCount = output.userInfo?["savedCount"] as? Int ?? 0
            }
            PostListing()
            .tabItem {
                Label("posts", systemImage: "tray.fill")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
