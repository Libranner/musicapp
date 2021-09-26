//
//  Artist.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 24/9/21.
//

import Foundation

struct Artist: Identifiable, Hashable, Codable {
  let id: Double
  let name: String
  let pictureSmall, pictureMedium, pictureBig, pictureXl: String
}
