//
//  ArtistsListView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct ArtistsListView: View {
  @ObservedObject private var viewModel = ArtistListViewModel(with: ArtistsRemoteRepository())

  var body: some View {
    NavigationView {
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 25) {
          ForEach(viewModel.searchResult) { artist in
            HStack(spacing: 15) {
              ThumbnailImageView(imageURL: artist.pictureURL)
              Text(artist.name)
            }
          }
        }
        .padding()
      }
      .searchable(text: $viewModel.searchQuery, prompt: "Search...")
      .navigationTitle("Artists")
      .foregroundColor(Color.white)
      .background(Color.black)
    }
  }
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView()
    }
}
