//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Ensi Khosravi on 12.02.2024.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
