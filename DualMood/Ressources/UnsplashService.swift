//
//  UnsplashService.swift
//  DualMood
//
//  Created by Matime Marvin on 18/12/2024.
//

import Foundation

class UnsplashService {
    
    let appId = "575727"
    let accessKey = "8j7cdQS9HM1tfIomk_dUwqrIZ7wnymEECz6xk6OPP6k"
    let baseURL = "https://api.unsplash.com/"

    func getFeaturedPhotos() async throws -> [String] {
        let url = photosUrl()
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.cantFindData
        }
        do {
            let imageInfos = try JSONDecoder().decode([ImageInfo].self, from: data)
            return imageInfos.map { $0.urls.regular }
        } catch {
            throw APIError.decodingError
        }
    }

    func photosUrl() -> URL {
        URL(string: baseURL + "/photos/?client_id=" + accessKey)!
    }
}

// a voir, ici ?
class ImageInfo: Codable {
    let urls: ImageUrl
}

class ImageUrl: Codable {
    let regular: String
}
