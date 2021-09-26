//
//  ThumbnailImageView.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import SwiftUI

struct ThumbnailImageView: View {
  let imageURL: URL?

  var body: some View {
    AsyncImage(url: imageURL, transaction: Transaction(animation: .easeInOut)) { phase in
      switch phase {
      case .empty:
        ProgressView()
      case .success(let image):
        image
          .resizable()
          .scaledToFill()
          .frame(maxWidth: 70, maxHeight: 50)
          .transition(.scale(scale: 0.1, anchor: .center))
      case .failure:
        Image(systemName: "exclamationmark.icloud")
          .frame(maxWidth: 40, maxHeight: 40)
      @unknown default:
        EmptyView()
      }
    }
  }
}

struct ThumbnailImageView_Previews: PreviewProvider {
  static var previews: some View {
    return ThumbnailImageView(imageURL: nil)
  }
}
