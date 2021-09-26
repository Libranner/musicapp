//
//  ArtistsListView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct ArtistsListView: View {
  private let repository: ArtistsRepository
  @ObservedObject private var viewModel: ArtistListViewModel

  init(repository: ArtistsRepository = ArtistsRemoteRepository()) {
    self.repository = repository
    self.viewModel = ArtistListViewModel(with: repository)
  }

  var body: some View {
    NavigationView {
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 25) {
          ForEach(viewModel.searchResult) { artist in
            NavigationLink(destination: AlbumListView(viewModel: AlbumListViewModel(with: repository, artist: artist))) {
              HStack(spacing: 15) {
                ThumbnailImageView(imageURL: artist.pictureURL, size: CGSize(width: 70, height: 50))
                Text(artist.name)
              }
            }
          }
        }
        .padding()
      }
      .searchable(text: $viewModel.searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search...")
      .navigationTitle("Artists")
      .navigationBarTitleDisplayMode(.inline)
      .foregroundColor(Color.white)
      .background(Color.black)
    }
  }
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        ArtistsListView()
      }
    }
}
