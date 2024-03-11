//
//  Search.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let total, totalPages: Int?
    let results: [SearchResult]?
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct SearchResult: Codable {
    let id, slug: String?
    let description, altDescription: String?
    let urls: UrlsSearch?
    let links: ResultLinksSearch?
    let likes: Int?
    let user: UserSearch?
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case user
    }
}

// MARK: - ResultLinks
struct ResultLinksSearch: Codable {
    let linksSelf, html, download: String?
    let downloadLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Source
struct SourceSearch: Codable {
    let ancestry: AncestrySearch?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: CoverPhotoSearch?
    
    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct AncestrySearch: Codable {
    let type, category, subcategory: CategorySearch?
}

// MARK: - Category
struct CategorySearch: Codable {
    let slug, prettySlug: String?
    
    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - CoverPhoto
struct CoverPhotoSearch: Codable {
    let id, slug: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsSearch?
    let links: ResultLinksSearch?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: String?
    let topicSubmissions: CoverPhotoTopicSubmissionsSearch?
    let premium, plus: Bool?
    let user: UserSearch?
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case sponsorship
        case topicSubmissions = "topic_submissions"
        case premium, plus, user
    }
}

// MARK: - CoverPhotoTopicSubmissions
struct CoverPhotoTopicSubmissionsSearch: Codable {
    let nature, wallpapers: NatureSearch?
}

// MARK: - Nature
struct NatureSearch: Codable {
    let status: String?
    let approvedOn: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - Urls
struct UrlsSearch: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct UserSearch: Codable {
    let id: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinksSearch?
    let profileImage: ProfileImageSearch?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialSearch?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
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
    }
}

// MARK: - UserLinks
struct UserLinksSearch: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImageSearch: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct SocialSearch: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
    let paypalEmail: String?
    
    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }
}

