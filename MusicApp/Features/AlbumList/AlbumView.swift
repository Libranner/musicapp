//
//  AlbumView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct AlbumView: View {
  let album: Album
  let artist: Artist

  var body: some View {
    VStack(alignment: .leading) {
      ThumbnailImageView(imageURL: album.coverURL, size: CGSize(width: 200, height: 200))
      Text(album.title)
        .font(.title)
        .foregroundColor(Color.white)
        .lineLimit(1)
      Text(artist.name)
        .foregroundColor(Color.gray)
    }
  }
}

struct AlbumView_Previews: PreviewProvider {
  static var previews: some View {
    let artist = Artist(id: 1, name: "Artist Test", picture: "http://api.deezer.com/artist/4768753/image")
    let album = Album(id: 1, title: "Title Test", cover: "https://api.deezer.com/album/111242762/image")
    AlbumView(album: album, artist: artist)
      .background(Color.black)
  }
}
