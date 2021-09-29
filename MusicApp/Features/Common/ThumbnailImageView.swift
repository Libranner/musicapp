//
//  ThumbnailImageView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct ThumbnailImageView: View {
  let imageURL: URL?
  let size: CGSize

  var body: some View {
    AsyncImage(url: imageURL, transaction: Transaction(animation: .easeInOut)) { phase in
      switch phase {
      case .empty:
        ProgressView()
      case .success(let image):
        image
          .resizable()
          .scaledToFill()
          .frame(maxWidth: size.width, maxHeight: size.height)
          .transition(.scale(scale: 0.1, anchor: .center))
      case .failure:
        Image(systemName: "exclamationmark.icloud")
          .frame(maxWidth: size.width, maxHeight: size.height)
      @unknown default:
        EmptyView()
      }
    }
  }
}

struct ThumbnailImageView_Previews: PreviewProvider {
  static var previews: some View {
    return ThumbnailImageView(imageURL: URL(string: "https://api.deezer.com/album/149198842/image"), size: CGSize(width: 20, height: 20))
  }
}
