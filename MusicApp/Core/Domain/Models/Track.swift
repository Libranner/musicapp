//
//  Track.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 24/9/21.
//

import Foundation

struct Track: Identifiable, Hashable, Codable {
  let id: Int
  let title: String
  let link: String
  let duration: Int
  let trackPosition: Int
  let diskNumber: Int
}
