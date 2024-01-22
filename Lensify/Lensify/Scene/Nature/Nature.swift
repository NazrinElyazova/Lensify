//
//  Nature.swift
//  Lensify
//
//  Created by Nazrin on 15.01.24.
//

import Foundation


// MARK: - Photo
struct Photo: Codable {
    
    let id, slug: String?
    let createdAt, updatedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsNature?
    let links: PhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: Sponsorship?
    let topicSubmissions: TopicSubmissions?
    let user: UserNature?
    let promotedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case sponsorship
        case topicSubmissions = "topic_submissions"
        case user
        case promotedAt = "promoted_at"
    }
}

// MARK: - PhotoLinks
struct PhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    let impressionUrls: [String]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: UserNature?

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct UserNature: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinksNature?
    let profileImage: ProfileImageNature?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialNature?
    let lastName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case totalPromotedPhotos = "total_promoted_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
        case lastName = "last_name"
    }
}

// MARK: - UserLinks
struct UserLinksNature: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImageNature: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct SocialNature: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    let travel, wallpapers, experimental: Experimental?
    let texturesPatterns: ArchitectureInterior?
    let nature: Experimental?
    let artsCulture, spirituality, architectureInterior, minimalism: ArchitectureInterior?
    let streetPhotography: ArchitectureInterior?

    enum CodingKeys: String, CodingKey {
        case travel, wallpapers, experimental
        case texturesPatterns = "textures-patterns"
        case nature
        case artsCulture = "arts-culture"
        case spirituality
        case architectureInterior = "architecture-interior"
        case minimalism
        case streetPhotography = "street-photography"
    }
}

// MARK: - ArchitectureInterior
struct ArchitectureInterior: Codable {
    let status: String?
}

// MARK: - Experimental
struct Experimental: Codable {
    let status: String?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - Urls
struct UrlsNature: Codable {
    
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}


