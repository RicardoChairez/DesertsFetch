//
//  MealPreview.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation
import SwiftUI

struct RecipePreview: Codable, Equatable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case cuisine = "cuisine"
        case id = "uuid"
        case imageURLString = "photo_url_large"
    }
    
    var name: String
    var cuisine: String
    var id: String
    var imageURLString: String
    var imageURL: URL? {
        URL(string: imageURLString)
    }
    var imageData: Data?

}
