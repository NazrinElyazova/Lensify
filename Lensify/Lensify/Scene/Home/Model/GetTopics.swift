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

// MARK: - Urls
struct UrlsWallpapers: Codable {
    let full, regular, small: String?
    
    enum CodingKeys: String, CodingKey {
        case full, regular
        case small
    }
}
