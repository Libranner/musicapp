//
//  TrackTests.swift
//  MusicAppTests
//
//  Created by Libranner Leonel Santos Espinal on 30/9/21.
//

import XCTest
@testable import MusicApp

final class TrackTests: XCTestCase {
  func testModelIsDecodable() throws {
    let data = try XCTUnwrap(DataLoader.load(dataType: .tracks))

    let trackData = try XCTUnwrap(JSONDecoder().decode(Response<[Track]>.self, from: data))
    XCTAssertNotNil(trackData)
  }

  func testTrackDurationFormatted() {
    let track = Track(id: 1, title: "", link: "", duration: 103, trackPosition: 0, diskNumber: 0)
    XCTAssertEqual("1:43", track.formattedDuration)
  }
}
