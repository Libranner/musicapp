//
//  Response.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Foundation

struct Response<T: Decodable>: Decodable {
  var result: T

  enum CodingKeys: String, CodingKey {
    case result = "data"
  }
}
