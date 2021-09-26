//
//  Album.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 24/9/21.
//

import Foundation

struct Album: Identifiable, Hashable, Codable {
  let id: Int
  let title: String
  let cover: String

  var coverURL: URL? {
    URL(string: cover)
  }
}
