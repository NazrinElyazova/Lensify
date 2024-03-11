import Foundation

// MARK: - Get Topics
struct GetTopics: Codable {
    let id: String?
    let urls: UrlsWallpapers?
    
    enum CodingKeys: String, CodingKey {
        case id
        case urls
    }
}

// MARK: - TopicSubmissions
struct TopicSubmissionsWallpapers: Codable {
    let minimalism: The3_DRendersWallpapers?
    let travel, texturesPatterns, experimental, nature: The3_DRendersWallpapers?
    let wallpapers, the3DRenders, archival, architectureInterior: The3_DRendersWallpapers?
    let film, people, streetPhotography: The3_DRendersWallpapers?
    
    enum CodingKeys: String, CodingKey {
        case minimalism, travel
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

// MARK: - Urls
struct UrlsWallpapers: Codable {
//    let raw: String?
         let full, regular, small: String?
    //    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
//                case raw,
        case full, regular
        case small
        //        case thumb
        //        case smallS3 = "small_s3"
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
