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
    let coverPhoto: CoverPhotoTopicElement?
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
        case coverPhoto = "cover_photo"
        //        case previewPhotos = "preview_photos"
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
    //    let topicSubmissions: TopicSubmissionsWallpapers?
    //    let user: Usertop?
    
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
        //        case topicSubmissions = "topic_submissions"
        //        case user
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

// MARK: - TopicLinks
struct LinksTopicElement: Codable {
    let linksSelf, html, photos: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos
    }
}
//
//// MARK: - TopicElementElement
//struct TopicElement: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let promotedAt: String?
//    let width, height: Int?
//    let color, blurHash: String?
//    let description: String?
//    let altDescription: String?
////    let breadcrumbs: [JSONAny]?
//    let urls: UrlsTopicElement?
//    let links: LinksTopicElement?
//    let likes: Int?
//    let likedByUser: Bool?
////    let currentUserCollections: [JSONAny]?
////    let sponsorship: JSONNull?
//    let topicSubmissions: TopicSubmissionsTopicElement?
//    let user: UserTopicElement?
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case description
//        case altDescription = "alt_description"
////        case breadcrumbs
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
////        case currentUserCollections = "current_user_collections"
////        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case user
//    }
//}
//
//// MARK: - TopicElementLinks
//struct LinksTopicElement: Codable {
//    let linksSelf, html, download, downloadLocation: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, download
//        case downloadLocation = "download_location"
//    }
//}
//
//// MARK: - TopicSubmissions
//struct TopicSubmissionsTopicElement: Codable {
//    let coolTones, texturesPatterns, experimental, nature: ActForNatureTopicElement?
//    let wallpapers, monochromatic: ArchitectureInteriorTopicElement?
//    let actForNature: ActForNatureTopicElement?
//    let colorOfWater: ArchitectureInteriorTopicElement?
//    let spirituality, blue: ActForNatureTopicElement?
//    let health, travel, architectureInterior, film: ArchitectureInteriorTopicElement?
//    let minimalism, theHolidays: ArchitectureInteriorTopicElement?
//
//    enum CodingKeys: String, CodingKey {
//        case coolTones = "cool-tones"
//        case texturesPatterns = "textures-patterns"
//        case experimental, nature, wallpapers, monochromatic
//        case actForNature = "act-for-nature"
//        case colorOfWater = "color-of-water"
//        case spirituality, blue, health, travel
//        case architectureInterior = "architecture-interior"
//        case film, minimalism
//        case theHolidays = "the-holidays"
//    }
//}
//
//// MARK: - ActForNature
//struct ActForNatureTopicElement: Codable {
//    let status: StatusTopicElement?
//    let approvedOn: String?
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case approvedOn = "approved_on"
//    }
//}
//
//enum StatusTopicElement: String, Codable {
//    case approved = "approved"
//    case rejected = "rejected"
//    case unevaluated = "unevaluated"
//}
//
//// MARK: - ArchitectureInterior
//struct ArchitectureInteriorTopicElement: Codable {
//    let status: StatusTopicElement?
//}
//
//// MARK: - Urls
//struct UrlsTopicElement: Codable {
//    let raw, full, regular, small: String?
//    let thumb, smallS3: String?
//
//    enum CodingKeys: String, CodingKey {
//        case raw, full, regular, small, thumb
//        case smallS3 = "small_s3"
//    }
//}
//
//// MARK: - User
//struct UserTopicElement: Codable {
//    let id: String?
//    let updatedAt: String?
//    let username, name, firstName, lastName: String?
//    let twitterUsername: String?
//    let portfolioURL: String?
//    let bio: String?
//    let location: String?
//    let links: UserLinksTopicElement?
//    let profileImage: ProfileImageTopicElement?
//    let instagramUsername: String?
//    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
//    let acceptedTos, forHire: Bool?
//    let social: SocialTopicElement?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case updatedAt = "updated_at"
//        case username, name
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case twitterUsername = "twitter_username"
//        case portfolioURL = "portfolio_url"
//        case bio, location, links
//        case profileImage = "profile_image"
//        case instagramUsername = "instagram_username"
//        case totalCollections = "total_collections"
//        case totalLikes = "total_likes"
//        case totalPhotos = "total_photos"
//        case totalPromotedPhotos = "total_promoted_photos"
//        case acceptedTos = "accepted_tos"
//        case forHire = "for_hire"
//        case social
//    }
//}
//
//// MARK: - UserLinks
//struct UserLinksTopicElement: Codable {
//    let linksSelf, html, photos, likes: String?
//    let portfolio, following, followers: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, photos, likes, portfolio, following, followers
//    }
//}
//
//// MARK: - ProfileImage
//struct ProfileImageTopicElement: Codable {
//    let small, medium, large: String?
//}
//
//// MARK: - Social
//struct SocialTopicElement: Codable {
//    let instagramUsername: String?
//    let portfolioURL: String?
//    let twitterUsername: String?
////    let paypalEmail: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case instagramUsername = "instagram_username"
//        case portfolioURL = "portfolio_url"
//        case twitterUsername = "twitter_username"
////        case paypalEmail = "paypal_email"
//    }
//}
