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
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case description
        case altDescription = "alt_description"
        case urls, links, likes
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
// MARK: - Urls
struct UrlsSearch: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
