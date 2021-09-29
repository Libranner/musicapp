//
//  DataLoader.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import Foundation

enum DataType {
  case artists
  case albums
  case tracks

  var fileName: String {
    switch self {
    case .artists:
        return "artists"
    case .albums:
        return "albums"
    case .tracks:
      return "tracks"
    }
  }
}

struct DataLoader {
  static func load(dataType: DataType) throws -> Data {
    guard let json = Bundle.main.url(forResource: dataType.fileName, withExtension: "json") else {
      preconditionFailure("File not exists")
    }

    return try Data(contentsOf: json)
  }
}
