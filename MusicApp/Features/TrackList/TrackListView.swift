//
//  TrackListView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct TrackListView: View {
  @ObservedObject private var viewModel: TrackListViewModel

  init(repository: ArtistsRepository = ArtistsRemoteRepository(), album: Album) {
    self.viewModel = TrackListViewModel(with: repository, album: album)
  }

  var body: some View {
    VStack {
      GeometryReader { geometryReader in
        ThumbnailImageView(imageURL: viewModel.album.coverURL, size: CGSize(width: geometryReader.size.width, height: geometryReader.size.height * 0.6))
      }
      List {
        ForEach(viewModel.tracks) { track in
          HStack(spacing: 15) {
            Text("\(track.trackPosition).")
              .font(.body)
            VStack(alignment: .leading) {
              Text(track.title.uppercased())
                .font(.body)
            }
            Spacer()
            Text("\(track.formattedDuration)")
              .font(.caption)
          }
        }
        .listRowBackground(Color.clear)
      }
      .listStyle(.plain)
      .foregroundColor(.white)

    }
    .padding(.top, 100)
    .navigationTitle(viewModel.album.title)
    .background(Color.black).opacity(0.9)
    .onAppear {
      viewModel.getTracks()
    }
  }
}


struct TrackListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TrackListView(album: Album(id: 149198842, title: "Test Test", cover: "https://api.deezer.com/album/149198842/image"))
    }
  }
}
