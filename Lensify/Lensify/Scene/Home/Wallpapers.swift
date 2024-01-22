//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let unsplash = try? JSONDecoder().decode(Unsplash.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Wallpapers
//struct Wallpapers: Codable {
//    
//    let id, title: String?
//    let publishedAt, lastCollectedAt, updatedAt: String?
//    let featured: Bool?
//    let totalPhotos: Int?
//    let wallpapersPrivate: Bool?
//    let shareKey: String?
//    let tags: [Tag]?
//    let links: WallpapersLinks?
//    let user: User?
//    let coverPhoto: WallpapersCoverPhoto?
//    let previewPhotos: [PreviewPhoto]?
//    let description: String?
//
////    var titleLabel: String {
////        title ?? ""
////    }
////    
////    var imagePath: String {
////        "\(String(describing: coverPhoto))"
////    }
//    
//    
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case publishedAt = "published_at"
//        case lastCollectedAt = "last_collected_at"
//        case updatedAt = "updated_at"
//        case featured
//        case totalPhotos = "total_photos"
//        case wallpapersPrivate = "private"
//        case shareKey = "share_key"
//        case tags, links, user
//        case coverPhoto = "cover_photo"
//        case previewPhotos = "preview_photos"
//        case description
//    }
//}
//
//// MARK: - WallpapersCoverPhoto
//struct WallpapersCoverPhoto: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt, promotedAt: String?
//    let width, height: Int?
//    let color, blurHash, altDescription: String?
//    let urls: Urls?
//    let links: CoverPhotoLinks?
//    let likes: Int?
//    let likedByUser: Bool?
//    let topicSubmissions: PurpleTopicSubmissions?
//    let user: User?
//    let description: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case topicSubmissions = "topic_submissions"
//        case user, description
//    }
//}
//
//// MARK: - CoverPhotoLinks
//struct CoverPhotoLinks: Codable {
//    let linksSelf, html, download, downloadLocation: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, download
//        case downloadLocation = "download_location"
//    }
//}
//
//// MARK: - PurpleTopicSubmissions
//struct PurpleTopicSubmissions: Codable {
//    let health, holidays, foodDrink, the3DRenders: The3_DRenders?
//    let spirituality: The3_DRenders?
//
//    enum CodingKeys: String, CodingKey {
//        case health, holidays
//        case foodDrink = "food-drink"
//        case the3DRenders = "3d-renders"
//        case spirituality
//    }
//}
//
//// MARK: - The3_DRenders
//struct The3_DRenders: Codable {
//    let status: Status?
//    let approvedOn: String?
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case approvedOn = "approved_on"
//    }
//}
//
//enum Status: String, Codable {
//    case approved = "approved"
//}
//
//// MARK: - Urls
//struct Urls: Codable {
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
//struct User: Codable {
//    let id: String?
//    let updatedAt: String?
//    let username, name, firstName, lastName: String?
//    let portfolioURL: String?
//    let bio, location: String?
//    let links: UserLinks?
//    let profileImage: ProfileImage?
//    let instagramUsername: String?
//    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
//    let acceptedTos, forHire: Bool?
//    let social: Social?
//    let twitterUsername: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case updatedAt = "updated_at"
//        case username, name
//        case firstName = "first_name"
//        case lastName = "last_name"
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
//        case twitterUsername = "twitter_username"
//    }
//}
//
//// MARK: - UserLinks
//struct UserLinks: Codable {
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
//struct ProfileImage: Codable {
//    let small, medium, large: String?
//}
//
//// MARK: - Social
//struct Social: Codable {
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
//// MARK: - WallpapersLinks
//struct WallpapersLinks: Codable {
//    let linksSelf, html, photos, related: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, photos, related
//    }
//}
//
//// MARK: - PreviewPhoto
//struct PreviewPhoto: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let blurHash: String?
//    let urls: Urls?
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case blurHash = "blur_hash"
//        case urls
//    }
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let type: TypeEnum?
//    let title: String?
//    let source: Source?
//}
//
//// MARK: - Source
//struct Source: Codable {
//    let ancestry: Ancestry?
//    let title, subtitle, description, metaTitle: String?
//    let metaDescription: String?
//    let coverPhoto: SourceCoverPhoto?
//
//    enum CodingKeys: String, CodingKey {
//        case ancestry, title, subtitle, description
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case coverPhoto = "cover_photo"
//    }
//}
//
//// MARK: - Ancestry
//struct Ancestry: Codable {
//    let type, category, subcategory: Category?
//}
//
//// MARK: - Category
//struct Category: Codable {
//    let slug, prettySlug: String?
//
//    enum CodingKeys: String, CodingKey {
//        case slug
//        case prettySlug = "pretty_slug"
//    }
//}
//
//// MARK: - SourceCoverPhoto
//struct SourceCoverPhoto: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let width, height: Int?
//    let color, blurHash, altDescription: String?
//    let urls: Urls?
//    let links: CoverPhotoLinks?
//    let likes: Int?
//    let likedByUser: Bool?
//    let topicSubmissions: FluffyTopicSubmissions?
//    let premium, plus: Bool?
//    let user: User?
//    let promotedAt: String?
//    let description: String?
//    let breadcrumbs: [Breadcrumb]?
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case topicSubmissions = "topic_submissions"
//        case premium, plus, user
//        case promotedAt = "promoted_at"
//        case description, breadcrumbs
//    }
//}
//
//// MARK: - Breadcrumb
//struct Breadcrumb: Codable {
//    let slug, title: String?
//    let index: Int?
//    let type: TypeEnum?
//}
//
//enum TypeEnum: String, Codable {
//    case landingPage = "landing_page"
//    case search = "search"
//}
//
//// MARK: - FluffyTopicSubmissions
//struct FluffyTopicSubmissions: Codable {
//    let sports, health, people, currentEvents: The3_DRenders?
//    let texturesPatterns, wallpapers, theHolidays, spirituality: The3_DRenders?
//    let nature: The3_DRenders?
//
//    enum CodingKeys: String, CodingKey {
//        case sports, health, people
//        case currentEvents = "current-events"
//        case texturesPatterns = "textures-patterns"
//        case wallpapers
//        case theHolidays = "the-holidays"
//        case spirituality, nature
//    }
//}
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wallpapers = try? JSONDecoder().decode(Wallpapers.self, from: jsonData)

import Foundation

// MARK: - Wallpaper
struct Wallpapers: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let width, height: Int?
    let color, blurHash, altDescription: String?
    let urls: UrlsWallpapers?
    let links: WallpaperLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: TopicSubmissionsWallpapers?
    let user: UserWallpapers?
    let description: String?
    let promotedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case blurHash = "blur_hash"
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case user, description
        case promotedAt = "promoted_at"
    }
}

// MARK: - WallpaperLinks
struct WallpaperLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissionsWallpapers: Codable {
    let minimalism, wallpapers: ArchitectureInteriorWallpapers?
    let travel: BusinessWorkWallpapers?
    let nature, architectureInterior, texturesPatterns: ArchitectureInteriorWallpapers?
    let fashionBeauty, people: BusinessWorkWallpapers?
    let experimental: ArchitectureInteriorWallpapers?
    let businessWork, streetPhotography: BusinessWorkWallpapers?

    enum CodingKeys: String, CodingKey {
        case minimalism, wallpapers, travel, nature
        case architectureInterior = "architecture-interior"
        case texturesPatterns = "textures-patterns"
        case fashionBeauty = "fashion-beauty"
        case people, experimental
        case businessWork = "business-work"
        case streetPhotography = "street-photography"
    }
}

// MARK: - ArchitectureInterior
struct ArchitectureInteriorWallpapers: Codable {
    let status: ArchitectureInteriorStatusWallpapers?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

enum ArchitectureInteriorStatusWallpapers: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - BusinessWork
struct BusinessWorkWallpapers: Codable {
    let status: BusinessWorkStatusWallpapers?
}

enum BusinessWorkStatusWallpapers: String, Codable {
    case rejected = "rejected"
    case unevaluated = "unevaluated"
}

// MARK: - Urls
struct UrlsWallpapers: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct UserWallpapers: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername, bio, location: String?
    let links: UserLinksWallpapers?
    let profileImage: ProfileImageWallpapers?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialWallpapers?
    let portfolioURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
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
        case portfolioURL = "portfolio_url"
    }
}

// MARK: - UserLinks
struct UserLinksWallpapers: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImageWallpapers: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct SocialWallpapers: Codable {
    let instagramUsername, twitterUsername: String?
    let portfolioURL: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
    }
}

