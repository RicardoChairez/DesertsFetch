//
//  DesertsApp.swift
//  Deserts
//
//  Created by Chip Chairez on 8/6/24.
//

import SwiftUI

@main
struct DesertsApp: App {
    init() {
//        URLCache.shared.memoryCapacity = 100_000_000
        URLCache.shared.diskCapacity = 1_000_000_000
    }
    
    var body: some Scene {
        WindowGroup {
            RecipesView()
        }
    }
}
