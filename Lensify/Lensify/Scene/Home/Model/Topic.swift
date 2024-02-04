//
//  Topic.swift
//  Lensify
//
//  Created by Nazrin on 27.01.24.
//

import Foundation

// MARK: - TopicElement
struct TopicElement: Codable {
    let id, slug, title, description: String?
//    let publishedAt, updatedAt, startsAt, endsAt: Date?
//    let visibility: String?
//    let featured: Bool?
//    let totalPhotos: Int?
//    let links: TopicLinks?
//    let status: String?
//    let owners: [User]?
//    let coverPhoto: CoverPhotoWallpapers?
//    let previewPhotos: [PreviewPhoto]?

    enum CodingKeys: String, CodingKey {
        case id, slug, title, description
//        case publishedAt = "published_at"
//        case updatedAt = "updated_at"
//        case startsAt = "starts_at"
//        case endsAt = "ends_at"
//        case visibility, featured
//        case totalPhotos = "total_photos"
//        case links, status, owners
//        case coverPhoto = "cover_photo"
//        case previewPhotos = "preview_photos"
    }
}

// MARK: - CoverPhoto
struct CoverPhotoWallpapers: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsWallpapers?
    let links: CoverPhotoLinksWallpapers?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: TopicSubmissionsWallpapers?
    let user: UserWallpapers?

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
        case topicSubmissions = "topic_submissions"
        case user
    }
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinksWallpapers: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - TopicLinks
struct TopicLinks: Codable {
    let linksSelf, html, photos: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos
    }
}
