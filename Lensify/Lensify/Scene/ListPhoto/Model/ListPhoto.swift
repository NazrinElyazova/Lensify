//
//  ListPhoto.swift
//  Lensify
//
//  Created by Nazrin on 06.02.24.
//

import Foundation

// MARK: - ListPhotoElement

struct List: Codable {
    let url: Urls?
    let height: CGFloat?
//        let id: ListPhoto?
}
struct ListPhoto: Codable {
        let id/*, slug*/: String?
    //    let createdAt, updatedAt: String?
    //    let promotedAt: String?
    //    let width, height: Int?
    //    let color, blurHash: String?
    //    let description: String?
    //    let altDescription: String?
    let urls: Urls?
    //    let links: ListPhotoLinks?
    //    let likes: Int?
    //    let likedByUser: Bool?
    //    let sponsorship: Sponsorship?
    //    let topicSubmissions: TopicSubmissions?
    //    let user: User?
    
    enum CodingKeys: String, CodingKey {
                case id
        //        case slug
        //        case createdAt = "created_at"
        //        case updatedAt = "updated_at"
        //        case promotedAt = "promoted_at"
        //        case width, height, color
        //        case blurHash = "blur_hash"
        //        case description
        //        case altDescription = "alt_description"
        case urls
        //        case links, likes
        //        case likedByUser = "liked_by_user"
        //        case sponsorship
        //        case topicSubmissions = "topic_submissions"
        //        case user
    }
}

// MARK: - ListPhotoLinks
struct ListPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Sponsorship
struct Sponsorship: Codable {
    let impressionUrls: [String]?
    let tagline: String?
    let taglineURL: String?
    let sponsor: User?
    
    enum CodingKeys: String, CodingKey {
        case impressionUrls = "impression_urls"
        case tagline
        case taglineURL = "tagline_url"
        case sponsor
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    let updatedAt: String?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos, totalPromotedPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?
    
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

// MARK: - TopicSubmissions
struct TopicSubmissions: Codable {
    let coolTones, people: CoolTones?
    let travel: Travel?
    
    enum CodingKeys: String, CodingKey {
        case coolTones = "cool-tones"
        case people, travel
    }
}

// MARK: - CoolTones
struct CoolTones: Codable {
    let status: String?
    let approvedOn: Date?
    
    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

// MARK: - Travel
struct Travel: Codable {
    let status: String?
}

// MARK: - Urls
struct Urls: Codable {
    let /*raw, full, regular,*/ small: String?
    //    let thumb, smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case /*raw, full, regular, */small
        //             case thumb
        //        case smallS3 = "small_s3"
    }
}

