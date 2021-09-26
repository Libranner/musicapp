//
//  AlbumListView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct AlbumListView: View {
  @ObservedObject private var viewModel: AlbumListViewModel

  init(viewModel: AlbumListViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        ScrollView {
          LazyVGrid(columns: columns, spacing: 30) {
            ForEach(viewModel.albums) { album in
              AlbumView(album: album, artist: viewModel.artist)
            }
          }
        }
      }
      .padding()
      .navigationTitle("Albums")
      .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
      .background(Color.black).opacity(0.9)
      .onAppear {
        viewModel.getAlbums()
      }
    }
  }

  private var columns: [GridItem] {
    Array(repeating: .init(.flexible()), count: 2)
  }
}

struct AlbumListView_Previews: PreviewProvider {
  static var previews: some View {
    let artist = Artist(id: 4768753, name: "Test Artist", picture: "")
    let viewModel = AlbumListViewModel(with: ArtistsRemoteRepository(), artist: artist)
    AlbumListView(viewModel: viewModel)
  }
}
