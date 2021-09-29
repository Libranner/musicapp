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

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case link
    case duration
    case trackPosition = "track_position"
    case diskNumber = "disk_number"
  }

  var formattedDuration: String {
    let minutes =  duration/60
    let seconds = duration % 60
    return "\(minutes):\(seconds)"
  }
}
