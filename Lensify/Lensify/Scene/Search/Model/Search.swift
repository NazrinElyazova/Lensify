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
    let id, title: String?
    let publishedAt, lastCollectedAt, updatedAt: String?
    let featured: Bool?
    let totalPhotos: Int?
    let resultPrivate: Bool?
    let shareKey: String?
    let tags: [TagSearch]?
    let links: ResultLinksSearch?
//    let user: UserSearch?
    let coverPhoto: ResultCoverPhotoSearch?
    let previewPhotos: [PreviewPhotoSearch]?
  

    enum CodingKeys: String, CodingKey {
        case id, title
        case publishedAt = "published_at"
        case lastCollectedAt = "last_collected_at"
        case updatedAt = "updated_at"
        case featured
        case totalPhotos = "total_photos"
        case resultPrivate = "private"
        case shareKey = "share_key"
        case tags, links/*, user*/
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
        
  
    }
}

// MARK: - ResultCoverPhoto
struct ResultCoverPhotoSearch: Codable {
    let id, slug: String?
    let createdAt, updatedAt: String?
    let width, height: Int?
    let color, blurHash: String?
    let urls: UrlsSearch?
    let links: CoverPhotoLinksSearch?
    let likes: Int?
    let likedByUser: Bool?
//    let user: UserSearch?
    let promotedAt: String?
    let altDescription: String?
    let topicSubmissions: PurpleTopicSubmissionsSearch?
  
  
    let breadcrumbs: [BreadcrumbSearch]?

    enum CodingKeys: String, CodingKey {
        case id, slug
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case blurHash = "blur_hash"
        case urls, links, likes
        case likedByUser = "liked_by_user"
//        case user
        case promotedAt = "promoted_at"
        case altDescription = "alt_description"
        case topicSubmissions = "topic_submissions"
        case  breadcrumbs
    }
}

// MARK: - Breadcrumb
struct BreadcrumbSearch: Codable {
    let slug, title: String?
    let index: Int?
    let type: TypeEnumSearch?
}

enum TypeEnumSearch: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinksSearch: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - PurpleTopicSubmissions
struct PurpleTopicSubmissionsSearch: Codable {
    let streetPhotography, nature, travel, experimental: ExperimentalSearch?
    let wallpapers: WallpapersSearch?
 

    enum CodingKeys: String, CodingKey {
        case streetPhotography = "street-photography"
        case nature, travel, wallpapers, experimental
    }
}

// MARK: - Experimental
struct ExperimentalSearch: Codable {
    let status: StatusSearch?
    let approvedOn: String?
    
    enum CodingKeys: String, CodingKey {
                case status
        case approvedOn = "approved_on"
            }
    }
    
    enum StatusSearch: String, Codable {
        case approved = "approved"
        case rejected = "rejected"
    }
    
    // MARK: - Wallpapers
    struct WallpapersSearch: Codable {
        let status: StatusSearch?
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
        let updatedAt: String?
        let username, name, firstName, lastName: String?
        let bio: String?
//        let links: UserLinksSearch?
        let profileImage: ProfileImageSearch?
        let instagramUsername: String?
        let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
        let acceptedTos, forHire: Bool?
        let social: SocialSearch?
        let twitterUsername: String?
        let portfolioURL: String?
        let location: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case updatedAt = "updated_at"
            case username, name
            case firstName = "first_name"
            case lastName = "last_name"
            case bio/*, links*/
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
            case location
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
        
        
        enum CodingKeys: String, CodingKey {
            case instagramUsername = "instagram_username"
            case portfolioURL = "portfolio_url"
            case twitterUsername = "twitter_username"
            
        }
    }
    
    // MARK: - ResultLinks
    struct ResultLinksSearch: Codable {
        let linksSelf, html, photos, related: String?
        
        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case html, photos, related
        }
    }
    
    // MARK: - PreviewPhoto
    struct PreviewPhotoSearch: Codable {
        let id, slug: String?
        let createdAt, updatedAt: String?
        let blurHash: String?
        let urls: UrlsSearch?
        
        enum CodingKeys: String, CodingKey {
            case id, slug
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case blurHash = "blur_hash"
            case urls
        }
    }
    
    // MARK: - Tag
    struct TagSearch: Codable {
        let type: TypeEnumSearch?
        let title: String?
        let source: SourceSearch?
    }
    
    // MARK: - Source
    struct SourceSearch: Codable {
        let ancestry: AncestrySearch?
        let title, subtitle, metaTitle: String?
//        let descroption
        let metaDescription: String?
        let coverPhoto: SourceCoverPhotoSearch?
        
        enum CodingKeys: String, CodingKey {
            case ancestry, title, subtitle
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
    
    // MARK: - SourceCoverPhoto
    struct SourceCoverPhotoSearch: Codable {
        let id, slug: String?
        let createdAt, updatedAt: String?
        let promotedAt: String?
        let width, height: Int?
        let color, blurHash, altDescription: String?
        let breadcrumbs: [BreadcrumbSearch]?
        let urls: UrlsSearch?
        let links: CoverPhotoLinksSearch?
        let likes: Int?
        let likedByUser, premium, plus: Bool?
//        let user: UserSearch?
        let topicSubmissions: FluffyTopicSubmissionsSearch?
        
        
        enum CodingKeys: String, CodingKey {
            case id, slug
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case promotedAt = "promoted_at"
            case width, height, color
            case blurHash = "blur_hash"
            
            case altDescription = "alt_description"
            case breadcrumbs, urls, links, likes
            case likedByUser = "liked_by_user"
            case premium, plus/*, user*/
            case topicSubmissions = "topic_submissions"
            
        }
    }
    
    // MARK: - FluffyTopicSubmissions
    struct FluffyTopicSubmissionsSearch: Codable {
        let spirituality, texturesPatterns, nature, wallpapers: ExperimentalSearch?
        
        enum CodingKeys: String, CodingKey {
            case spirituality
            case texturesPatterns = "textures-patterns"
            case nature, wallpapers
        }
    }


