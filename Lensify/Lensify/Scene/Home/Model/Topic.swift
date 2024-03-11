//
//  Topic.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import Foundation

// MARK: - TopicElement
struct TopicElement: Codable {
    let id: String?
    let title: String?
    let coverPhoto: CoverPhotoTopicElement?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case coverPhoto = "cover_photo"
    }
}

// MARK: - CoverPhoto
struct CoverPhotoTopicElement: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsWallpapers?
    let links: CoverPhotoLinksTopicElement?
    let likes: Int?
    let likedByUser: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
    }
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinksTopicElement: Codable {
    let linksSelf, html, download, downloadLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}
