//
//  ArtistTests.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 29/9/21.
//

import XCTest
@testable import MusicApp

final class ArtistTests: XCTestCase {
  func testModelIsDecodable() throws {
    let data = try XCTUnwrap(DataLoader.load(dataType: .artists))

    let artistData = try XCTUnwrap(JSONDecoder().decode(Response<[Artist]>.self, from: data))
    XCTAssertNotNil(artistData)
  }
}
