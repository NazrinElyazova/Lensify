//
//  Profile.swift
//  Lensify
//
//  Created by Nazrin on 11.02.24.
//

import Foundation
// MARK: - Profile
struct Profile: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL, bio: String?
    let location: String?
    let links: ProfileLinksProfile?
    let profileImage: ProfileImageProfile?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialProfile?
    let followedByUser: Bool?
    let photos: [PhotoProfile]?
//    let badge: JSONNull?
    let tags: TagsProfile?
    let followersCount, followingCount: Int?
    let allowMessages: Bool?
    let numericID, downloads: Int?
    let meta: MetaProfile?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
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
        case followedByUser = "followed_by_user"
        case photos, /*badge,*/ tags
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case allowMessages = "allow_messages"
        case numericID = "numeric_id"
        case downloads, meta
    }
}

// MARK: - ProfileLinks
struct ProfileLinksProfile: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - Meta
struct MetaProfile: Codable {
    let index: Bool?
}

// MARK: - Photo
struct PhotoProfile: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let blurHash: String?
    let urls: UrlsProfile?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}

// MARK: - Urls
struct UrlsProfile: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - ProfileImage
struct ProfileImageProfile: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct SocialProfile: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
//    let paypalEmail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
//        case paypalEmail = "paypal_email"
    }
}

// MARK: - Tags
struct TagsProfile: Codable {
    let custom: [CustomProfile]?
    let aggregated: [AggregatedProfile]?
}

// MARK: - Aggregated
struct AggregatedProfile: Codable {
    let type: TypeEnumProfile?
    let title: String?
    let source: AggregatedSourceProfile?
}

// MARK: - AggregatedSource
struct AggregatedSourceProfile: Codable {
    let ancestry: AncestryProfile?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: PurpleCoverPhotoProfile?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct AncestryProfile: Codable {
    let type, category, subcategory: CategoryProfile?
}

// MARK: - Category
struct CategoryProfile: Codable {
    let slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - PurpleCoverPhoto
struct PurpleCoverPhotoProfile: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash: String?
    let description: String?
    let altDescription: String?
//    let breadcrumbs: [Breadcrumb]?
    let urls: UrlsProfile?
    let links: CoverPhotoLinksProfile?
    let likes: Int?
    let likedByUser: Bool?
//    let currentUserCollections: [JSONAny]?
//    let sponsorship: JSONNull?
    let topicSubmissions: PurpleTopicSubmissionsProfile?
    let premium, plus: Bool?
    let user: UserProfile?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
//        case breadcrumbs
        case urls, links, likes
        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
        case topicSubmissions = "topic_submissions"
        case premium, plus, user
    }
}

// MARK: - Breadcrumb
struct BreadcrumbProfile: Codable {
    let slug, title: String?
    let index: Int?
    let type: TypeEnumProfile?
}

enum TypeEnumProfile: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinksProfile: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - PurpleTopicSubmissions
struct PurpleTopicSubmissionsProfile: Codable {
    let wallpapers, nature, blue, spirituality: BlueProfile?
    let texturesPatterns: BlueProfile?

    enum CodingKeys: String, CodingKey {
        case wallpapers, nature, blue, spirituality
        case texturesPatterns = "textures-patterns"
    }
}

// MARK: - Blue
struct BlueProfile: Codable {
    let status: String?
    let approvedOn: Date?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - User
struct UserProfile: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: ProfileLinksProfile?
    let profileImage: ProfileImageProfile?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialProfile?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
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

// MARK: - Custom
struct CustomProfile: Codable {
    let type: TypeEnumProfile?
    let title: String?
    let source: CustomSourceProfile?
}

// MARK: - CustomSource
struct CustomSourceProfile: Codable {
    let ancestry: AncestryProfile?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: FluffyCoverPhotoProfile?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - FluffyCoverPhoto
struct FluffyCoverPhotoProfile: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let promotedAt: String?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
//    let breadcrumbs: [Breadcrumb]?
    let urls: UrlsProfile?
    let links: CoverPhotoLinksProfile?
    let likes: Int?
    let likedByUser: Bool?
//    let currentUserCollections: [JSONAny]?
//    let sponsorship: JSONNull?
    let topicSubmissions: FluffyTopicSubmissionsProfile?
    let premium, plus: Bool?
    let user: UserProfile?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
//        case breadcrumbs
        case urls, links, likes
        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
        case topicSubmissions = "topic_submissions"
        case premium, plus, user
    }
}

// MARK: - FluffyTopicSubmissions
struct FluffyTopicSubmissionsProfile: Codable {
    let wallpapers, nature, blue: BlueProfile?
}
