import Foundation

// MARK: - PhotoElement
struct GetTopics: Codable { // MARK: GET TOPICS
    let id/*, slug, title, description*/: String?
//    let publishedAt, updatedAt, startsAt, endsAt: String?
//    let visibility: VisibilityWallpapers?
//    let featured: Bool?
//    let totalPhotos: Int?
//    let links: PhotoLinksWallpapers?
//    let status: PhotoStatusWallpapers?
//    let owners: [UserWallpapers]?
    let urls: UrlsWallpapers?
//    let previewPhotos: [PreviewPhotoWallpapers]?

    enum CodingKeys: String, CodingKey {
        case id
//        case slug, title, description
//        case publishedAt = "published_at"
//        case updatedAt = "updated_at"
//        case startsAt = "starts_at"
//        case endsAt = "ends_at"
//        case visibility, featured
//        case totalPhotos = "total_photos"
//        case links, status, owners
        case urls
//        case previewPhotos = "preview_photos"
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissionsWallpapers: Codable {
    let minimalism: The3_DRendersWallpapers?
    let health, spirituality: HealthWallpapers?
    let travel, texturesPatterns, experimental, nature: The3_DRendersWallpapers?
    let wallpapers, the3DRenders, archival, architectureInterior: The3_DRendersWallpapers?
    let film, people, streetPhotography: The3_DRendersWallpapers?

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
struct The3_DRendersWallpapers: Codable {
    let status: The3DRendersStatusWallpapers?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

enum The3DRendersStatusWallpapers: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - Health
struct HealthWallpapers: Codable {
    let status: String?
}

// MARK: - Urls
struct UrlsWallpapers: Codable {
    let /*raw, full, regular,*/ small: String?
//    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
//        case raw, full, regular, 
             case small
//        case thumb
//        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct UserWallpapers: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinksWallpapers?
    let profileImage: ProfileImageWallpapers?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialWallpapers?
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
struct PhotoLinksWallpapers: Codable {
    let linksSelf, html, photos: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos
    }
}

// MARK: - PreviewPhoto
struct PreviewPhotoWallpapers: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let blurHash: String?
    let urls: UrlsWallpapers?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}

enum PhotoStatusWallpapers: String, Codable {
    case statusOpen = "open"
}

enum VisibilityWallpapers: String, Codable {
    case featured = "featured"
}



//
//// MARK: - GetTopicsElement
//struct GetTopics: Codable {
//    let id, slug, title, description: String?
//    let publishedAt, updatedAt, startsAt: String?
//    let endsAt: String?
////    let onlySubmissionsAfter: JSONNull?
//    let visibility: Visibility?
//    let featured: Bool?
//    let totalPhotos: Int?
////    let currentUserContributions: [JSONAny]?
////    let totalCurrentUserSubmissions: JSONNull?
//    let links: GetTopicsLinksGetTopics?
//    let status: GetTopicsStatus?
//    let owners: [UserGetTopics]?
//    let coverPhoto: CoverPhotoGetTopics?
//    let previewPhotos: [PreviewPhotoGetTopics]?
//
//    enum CodingKeys: String, CodingKey {
//        case id, slug, title, description
//        case publishedAt = "published_at"
//        case updatedAt = "updated_at"
//        case startsAt = "starts_at"
//        case endsAt = "ends_at"
////        case onlySubmissionsAfter = "only_submissions_after"
//        case visibility, featured
//        case totalPhotos = "total_photos"
////        case currentUserContributions = "current_user_contributions"
////        case totalCurrentUserSubmissions = "total_current_user_submissions"
//        case links, status, owners
//        case coverPhoto = "cover_photo"
//        case previewPhotos = "preview_photos"
//    }
//}
//
//// MARK: - CoverPhoto
//struct CoverPhotoGetTopics: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let promotedAt: String?
//    let width, height: Int?
//    let color, blurHash: String?
//    let description: String?
//    let altDescription: String?
////    let breadcrumbs: [JSONAny]?
//    let urls: UrlsGetTopics?
//    let links: CoverPhotoLinksGetTopics?
//    let likes: Int?
//    let likedByUser: Bool?
////    let currentUserCollections: [JSONAny]?
////    let sponsorship: JSONNull?
//    let topicSubmissions: TopicSubmissionsGetTopics?
//    let user: UserGetTopics?
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
//// MARK: - CoverPhotoLinks
//struct CoverPhotoLinksGetTopics: Codable {
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
//struct TopicSubmissionsGetTopics: Codable {
//    let coolTones, texturesPatterns: The3_DRendersGetTopics?
//    let experimental: ActForNatureGetTopics?
//    let nature, wallpapers: The3_DRendersGetTopics?
//    let monochromatic, actForNature, colorOfWater: ActForNatureGetTopics?
//    let the3DRenders, travel, architectureInterior, interiors: The3_DRendersGetTopics?
//    let streetPhotography: The3_DRendersGetTopics?
//    let businessWork: ActForNatureGetTopics?
//    let film, archival, currentEvents: The3_DRendersGetTopics?
//
//    enum CodingKeys: String, CodingKey {
//        case coolTones = "cool-tones"
//        case texturesPatterns = "textures-patterns"
//        case experimental, nature, wallpapers, monochromatic
//        case actForNature = "act-for-nature"
//        case colorOfWater = "color-of-water"
//        case the3DRenders = "3d-renders"
//        case travel
//        case architectureInterior = "architecture-interior"
//        case interiors
//        case streetPhotography = "street-photography"
//        case businessWork = "business-work"
//        case film, archival
//        case currentEvents = "current-events"
//    }
//}
//
//// MARK: - ActForNature
//struct ActForNatureGetTopics: Codable {
//    let status: The3DRendersStatusGetTopics?
//}
//
//enum The3DRendersStatusGetTopics: String, Codable {
//    case approved = "approved"
//    case rejected = "rejected"
//    case unevaluated = "unevaluated"
//}
//
//// MARK: - The3_DRenders
//struct The3_DRendersGetTopics: Codable {
//    let status: The3DRendersStatusGetTopics?
//    let approvedOn: String?
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case approvedOn = "approved_on"
//    }
//}
//
//// MARK: - Urls
//struct UrlsGetTopics: Codable {
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
//struct UserGetTopics: Codable {
//    let id: String?
//    let updatedAt: String?
//    let username, name, firstName: String?
//    let lastName, twitterUsername: String?
//    let portfolioURL: String?
//    let bio, location: String?
//    let links: UserLinksGetTopics?
//    let profileImage: ProfileImageGetTopics?
//    let instagramUsername: String?
//    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
//    let acceptedTos, forHire: Bool?
//    let social: SocialGetTopics?
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
//struct UserLinksGetTopics: Codable {
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
//struct ProfileImageGetTopics: Codable {
//    let small, medium, large: String?
//}
//
//// MARK: - Social
//struct SocialGetTopics: Codable {
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
//
//// MARK: - GetTopicsLinks
//struct GetTopicsLinksGetTopics: Codable {
//    let linksSelf, html, photos: String?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, photos
//    }
//}
//
//// MARK: - PreviewPhoto
//struct PreviewPhotoGetTopics: Codable {
//    let id, slug: String?
//    let createdAt, updatedAt: String?
//    let blurHash: String?
//    let urls: UrlsGetTopics?
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
//enum GetTopicsStatus: String, Codable {
//    case statusOpen = "open"
//}
//
//enum Visibility: String, Codable {
//    case featured = "featured"
//}
