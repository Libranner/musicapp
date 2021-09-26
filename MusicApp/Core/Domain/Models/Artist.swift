//
//  Artist.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 24/9/21.
//

import Foundation

struct Artist: Identifiable, Hashable, Codable {
  let id: Int
  let name: String
  let picture: String

  var pictureURL: URL? {
    URL(string: picture)
  }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case picture = "picture_medium"
  }
}
