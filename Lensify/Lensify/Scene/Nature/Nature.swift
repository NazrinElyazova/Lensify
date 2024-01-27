//
//  Nature.swift
//  Lensify
//
//  Created by Nazrin on 15.01.24.
//

//import Foundation


//// MARK: - Photo
//struct Photo: Codable {
//    
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let width, height: Int?
//    let color, blurHash, description, altDescription: String?
//    let urls: UrlsNature?
//    let links: PhotoLinks?
//    let likes: Int?
//    let likedByUser: Bool?
//    let sponsorship: Sponsorship?
//    let topicSubmissions: TopicSubmissions?
//    let user: UserNature?
//    let promotedAt: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case id, slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case description
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case user
//        case promotedAt = "promoted_at"
//    }
//}
//
//// MARK: - PhotoLinks
//struct PhotoLinks: Codable {
//    let linksSelf, html, download, downloadLocation: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, download
//        case downloadLocation = "download_location"
//    }
//}
//
//// MARK: - Sponsorship
//struct Sponsorship: Codable {
//    let impressionUrls: [String]?
//    let tagline: String?
//    let taglineURL: String?
//    let sponsor: UserNature?
//
//    enum CodingKeys: String, CodingKey {
//        case impressionUrls = "impression_urls"
//        case tagline
//        case taglineURL = "tagline_url"
//        case sponsor
//    }
//}
//
//// MARK: - User
//struct UserNature: Codable {
//    let id: String?
//    let updatedAt: String?
//    let username, name, firstName, twitterUsername: String?
//    let portfolioURL: String?
//    let bio, location: String?
//    let links: UserLinksNature?
//    let profileImage: ProfileImageNature?
//    let instagramUsername: String?
//    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
//    let acceptedTos, forHire: Bool?
//    let social: SocialNature?
//    let lastName: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case updatedAt = "updated_at"
//        case username, name
//        case firstName = "first_name"
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
//        case lastName = "last_name"
//    }
//}
//
//// MARK: - UserLinks
//struct UserLinksNature: Codable {
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
//struct ProfileImageNature: Codable {
//    let small, medium, large: String?
//}
//
//// MARK: - Social
//struct SocialNature: Codable {
//    let instagramUsername: String?
//    let portfolioURL: String?
//    let twitterUsername: String?
//
//    enum CodingKeys: String, CodingKey {
//        case instagramUsername = "instagram_username"
//        case portfolioURL = "portfolio_url"
//        case twitterUsername = "twitter_username"
//    }
//}
//
//// MARK: - TopicSubmissions
//struct TopicSubmissions: Codable {
//    let travel, wallpapers, experimental: Experimental?
//    let texturesPatterns: ArchitectureInterior?
//    let nature: Experimental?
//    let artsCulture, spirituality, architectureInterior, minimalism: ArchitectureInterior?
//    let streetPhotography: ArchitectureInterior?
//
//    enum CodingKeys: String, CodingKey {
//        case travel, wallpapers, experimental
//        case texturesPatterns = "textures-patterns"
//        case nature
//        case artsCulture = "arts-culture"
//        case spirituality
//        case architectureInterior = "architecture-interior"
//        case minimalism
//        case streetPhotography = "street-photography"
//    }
//}
//
//// MARK: - ArchitectureInterior
//struct ArchitectureInterior: Codable {
//    let status: String?
//}
//
//// MARK: - Experimental
//struct Experimental: Codable {
//    let status: String?
//    let approvedOn: String?
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case approvedOn = "approved_on"
//    }
//}
//
//// MARK: - Urls
//struct UrlsNature: Codable {
//    
//    let raw, full, regular, small: String?
//    let thumb, smallS3: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case raw, full, regular, small, thumb
//        case smallS3 = "small_s3"
//    }
//}
//
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try? JSONDecoder().decode(Photo.self, from: jsonData)

import Foundation

// MARK: - PhotoElement
struct Photo: Codable {
    let id, slug, title, description: String?
    let publishedAt, updatedAt, startsAt, endsAt: String?
    let visibility: Visibility?
    let featured: Bool?
    let totalPhotos: Int?
    let links: PhotoLinks?
    let status: PhotoStatus?
    let owners: [User]?
    let coverPhoto: CoverPhoto?
    let previewPhotos: [PreviewPhoto]?

    enum CodingKeys: String, CodingKey {
        case id, slug, title, description
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
        case visibility, featured
        case totalPhotos = "total_photos"
        case links, status, owners
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: Urls?
    let links: CoverPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: TopicSubmissions?
    let user: User?

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
struct CoverPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    let minimalism: The3_DRenders?
    let health, spirituality: Health?
    let travel, texturesPatterns, experimental, nature: The3_DRenders?
    let wallpapers, the3DRenders, archival, architectureInterior: The3_DRenders?
    let film, people, streetPhotography: The3_DRenders?

    enum CodingKeys: String, CodingKey {
        case minimalism, health, spirituality, travel
        case texturesPatterns = "textures-patterns"
        case experimental, nature, wallpapers
        case the3DRenders = "3d-renders"
        case archival
        case architectureInterior = "architecture-interior"
        case film, people
        case streetPhotography = "street-photography"
    }
}

// MARK: - The3_DRenders
struct The3_DRenders: Codable {
    let status: The3DRendersStatus?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

enum The3DRendersStatus: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - Health
struct Health: Codable {
    let status: String?
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
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
        case twitterUsername = "twitter_username"
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
    }
}

// MARK: - PhotoLinks
struct PhotoLinks: Codable {
    let linksSelf, html, photos: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos
    }
}

// MARK: - PreviewPhoto
struct PreviewPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let blurHash: String?
    let urls: Urls?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}

enum PhotoStatus: String, Codable {
    case statusOpen = "open"
}

enum Visibility: String, Codable {
    case featured = "featured"
}


