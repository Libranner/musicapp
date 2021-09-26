//
//  APIError.swift
//  MusicApp
//
//  Created by Libranner Leonel Santos Espinal on 26/9/21.
//

import Foundation

enum APIError: Error {
  case network(description: String)
  case parsing(description: String)
  case badURL
}
