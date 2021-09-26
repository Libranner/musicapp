//
//  MusicAppApp.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 24/9/21.
//

import SwiftUI

@main
struct MusicAppApp: App {
    var body: some Scene {
        WindowGroup {
            ArtistsListView()
            .onAppear {
              let navBarAppearance = UINavigationBar.appearance()
              navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
              navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            }
        }
    }
}
