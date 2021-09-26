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
      VStack(alignment: .leading) {
        ScrollView {
          List(viewModel.searchResult) { artist in
            Text(artist.name)
          }
        }
      }
      .padding()
      .searchable(text: $viewModel.searchQuery, prompt: "Search...", suggestions: {
        ForEach(viewModel.searchResult, id: \.self) { suggestion in
          Text(suggestion.name)
            .searchCompletion(suggestion.name)
        }
      })
      .navigationTitle("Artists")
      .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
    }
  }
}

struct ArtistsListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsListView()
    }
}
