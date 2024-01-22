//
//  Architecture.swift
//  Lensify
//
//  Created by Nazrin on 16.01.24.
//

import Foundation

struct Architecture: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsArch?
    let links: GetPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let sponsorship: Sponsorship?
    let user: UserArch?
    let exif: Exif?
    let location: Location?
    let meta: Meta?
    let publicDomain: Bool?
    let tags: [GetPhotoTag]?
    let tagsPreview: [TagsPreviewArch]?
    let views, downloads: Int?
    let relatedCollections: RelatedCollections?

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
        case sponsorship, user, exif, location, meta
        case publicDomain = "public_domain"
        case tags
        case tagsPreview = "tags_preview"
        case views, downloads
        case relatedCollections = "related_collections"
    }
}

// MARK: - Exif
struct Exif: Codable {
    let focalLength: String?

    enum CodingKeys: String, CodingKey {
        case focalLength = "focal_length"
    }
}

// MARK: - GetPhotoLinks
struct GetPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let position: Position?
}

// MARK: - Position
struct Position: Codable {
    let latitude, longitude: Int?
}

// MARK: - Meta
struct Meta: Codable {
    let index: Bool?
}

// MARK: - RelatedCollections
struct RelatedCollections: Codable {
    let total: Int?
    let type: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let id, title: String?
    let publishedAt, lastCollectedAt, updatedAt: Date?
    let featured: Bool?
    let totalPhotos: Int?
    let resultPrivate: Bool?
    let shareKey: String?
    let tags: [ResultTag]?
    let links: ResultLinks?
    let user: UserArch?
    let coverPhoto: ResultCoverPhoto?
    let previewPhotos: [PreviewPhotoArch]?

    enum CodingKeys: String, CodingKey {
        case id, title
        case publishedAt = "published_at"
        case lastCollectedAt = "last_collected_at"
        case updatedAt = "updated_at"
        case featured
        case totalPhotos = "total_photos"
        case resultPrivate = "private"
        case shareKey = "share_key"
        case tags, links, user
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
}

// MARK: - ResultCoverPhoto
struct ResultCoverPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height: Int?
    let color, blurHash, altDescription: String?
    let urls: UrlsArch?
    let links: GetPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let user: UserArch?
    let topicSubmissions: PurpleTopicSubmissionsArch?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case user
        case topicSubmissions = "topic_submissions"
        case description
    }
}

// MARK: - PurpleTopicSubmissions
struct PurpleTopicSubmissionsArch: Codable {
    let retro: Retro?
}

// MARK: - Retro
struct Retro: Codable {
    let status: StatusArch?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

enum StatusArch: String, Codable {
    case approved = "approved"
}

// MARK: - Urls
struct UrlsArch: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct UserArch: Codable {
    let id: String?
    let updatedAt: Date?
    let username, name, firstName: String?
    let lastName: String?
    let bio, location: String?
    let links: UserLinksArch?
    let profileImage: ProfileImageArch?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: SocialArch?
    let twitterUsername: String?
    let portfolioURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
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
        case portfolioURL = "portfolio_url"
    }
}

// MARK: - UserLinks
struct UserLinksArch: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImageArch: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct SocialArch: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
    }
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, photos, related: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, related
    }
}

// MARK: - PreviewPhoto
struct PreviewPhotoArch: Codable {
    let id, slug: String?
    let createdAt, updatedAt: Date?
    let blurHash: String?
    let urls: UrlsArch?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case blurHash = "blur_hash"
        case urls
    }
}

// MARK: - ResultTag
struct ResultTag: Codable {
    let type: TypeEnumArch?
    let title: String?
    let source: PurpleSource?
}

// MARK: - PurpleSource
struct PurpleSource: Codable {
    let ancestry: AncestryArch?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: PurpleCoverPhotoArch?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct AncestryArch: Codable {
    let type, category, subcategory: CategoryArch?
}

// MARK: - Category
struct CategoryArch: Codable {
    let slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - PurpleCoverPhoto
struct PurpleCoverPhotoArch: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let urls: UrlsArch?
    let links: GetPhotoLinks?
    let likes: Int?
    let likedByUser, premium, plus: Bool?
    let user: UserArch?
    let topicSubmissions: FluffyTopicSubmissionsArch?
    let breadcrumbs: [BreadcrumbArch]?

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
        case premium, plus, user
        case topicSubmissions = "topic_submissions"
        case breadcrumbs
    }
}

// MARK: - Breadcrumb
struct BreadcrumbArch: Codable {
    let slug, title: String?
    let index: Int?
    let type: TypeEnumArch?
}

enum TypeEnumArch: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - FluffyTopicSubmissions
struct FluffyTopicSubmissionsArch: Codable {
    let health, colorOfWater, texturesPatterns, nature: Retro?
    let wallpapers, architectureInterior: Retro?

    enum CodingKeys: String, CodingKey {
        case health
        case colorOfWater = "color-of-water"
        case texturesPatterns = "textures-patterns"
        case nature, wallpapers
        case architectureInterior = "architecture-interior"
    }
}

// MARK: - Sponsorship
struct SponsorshipArch: Codable {
    let impressionUrls: [String]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: UserArch?

    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - GetPhotoTag
struct GetPhotoTag: Codable {
    let type: TypeEnumArch?
    let title: String?
    let source: FluffySource?
}

// MARK: - FluffySource
struct FluffySource: Codable {
    let ancestry: AncestryArch?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: FluffyCoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - FluffyCoverPhoto
struct FluffyCoverPhoto: Codable {
    let id, slug: String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height: Int?
    let color, blurHash, description, altDescription: String?
    let breadcrumbs: [BreadcrumbArch]?
    let urls: UrlsArch?
    let links: GetPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: TentacledTopicSubmissions?
    let premium, plus: Bool?
    let user: UserArch?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case breadcrumbs, urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case premium, plus, user
    }
}

// MARK: - TentacledTopicSubmissions
struct TentacledTopicSubmissions: Codable {
    let nature, wallpapers, architectureInterior, colorOfWater: Retro?
    let currentEvents: Retro?

    enum CodingKeys: String, CodingKey {
        case nature, wallpapers
        case architectureInterior = "architecture-interior"
        case colorOfWater = "color-of-water"
        case currentEvents = "current-events"
    }
}

// MARK: - TagsPreview
struct TagsPreviewArch: Codable {
    let type: TypeEnumArch?
    let title: String?
}
