//
//  DesertsViewModel.swift
//  Deserts
//
//  Created by Chip Chairez on 8/7/24.
//

import Foundation
import SwiftUI

struct RecipePreviewsResponse: Codable {
    var recipes: [RecipePreview]
}
enum RecipesViewStates {
    case loading, loaded, loadFailed, notLoaded
}

@MainActor
final class RecipesViewModel: ObservableObject{
    private let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    @Published var recipePreviews: [RecipePreview] = []
    @Published var showAlert = false
    @Published var vmState: RecipesViewStates = .notLoaded
    @Published var alertText = ""
    
    
    func getRecipes() async throws -> [RecipePreview] {
        var recipePreviewsResponse = try await NetworkManager.shared.request(modelType: RecipePreviewsResponse.self, url: URL(string: endpoint)).recipes
        recipePreviewsResponse = copyImages(recipePreviews: recipePreviewsResponse)
        return recipePreviewsResponse.sorted(by: {$0.cuisine < $1.cuisine})
    }
    
    func copyImages(recipePreviews: [RecipePreview]) -> [RecipePreview]{
        var newRecipePreviews = recipePreviews
        for i in 0..<recipePreviews.count {
            if let index = self.recipePreviews.firstIndex(where: {$0.id == self.recipePreviews[i].id}) {
                newRecipePreviews[index].imageData = recipePreviews[i].imageData
            }
        }
        return newRecipePreviews
    }
    
    func downloadImage(for recipePreview: RecipePreview) async {
        guard let index = recipePreviews.firstIndex(where: {$0 == recipePreview}), recipePreview.imageURL != nil else {
            return
        }
        let data = try? await NetworkManager.shared.fetchData(url: recipePreview.imageURL)
        withAnimation(.easeIn) {
            recipePreviews[index].imageData = data
        }
    }
}
