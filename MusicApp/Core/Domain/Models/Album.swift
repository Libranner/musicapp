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

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case cover = "cover_medium"
  }
}
